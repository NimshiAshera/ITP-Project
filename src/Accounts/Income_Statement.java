package Accounts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.Locale;

public class Income_Statement {

    private static String sql;
    private static ResultSet res;
    private static String netStatus = null;
    private static Float net_income_before_discount = 0.0f;
    private static int discount_percentage = 85;
    
    //Returns numerical figure with ',' seperators
    public static String getNumberWithSeparator(String string_figure) {

        Double amount = Double.parseDouble(string_figure);
        
        NumberFormat formatter = NumberFormat.getInstance(new Locale("en_US"));

        DecimalFormatSymbols symbols = DecimalFormatSymbols.getInstance();
        symbols.setGroupingSeparator(',');
        DecimalFormat seperatorFormatter = new DecimalFormat("###,###.##", symbols);

        String amountWithSeparator = seperatorFormatter.format(amount).toString();

        return amountWithSeparator;
    }

    //Returns all transactions of a specific department
    public static ResultSet getDepartmentTransactions(String department) throws ClassNotFoundException, SQLException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT Date, Business_name, Amount FROM `booking_payment` WHERE Status = 'confirmed' AND `Department` ='" + department + "'";

            res = st.executeQuery(sql);
        }
        return res;
    }

    //Returns all expense transactions for a specific year and month 
    public static ResultSet getCurrentYearMonthlyExpenseTransactions(String month, String year) throws ClassNotFoundException, SQLException {

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT `Type`, SUM(`Amount`) AS 'Total' FROM `business_payment` WHERE MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "' GROUP BY `Type`";

            res = st.executeQuery(sql);
        }
        return res;
    }

    //Returns specific department income for specified year and month 
    public static String getCurrentYearMonthlyDepartmentIncome(String department, String month, String year) throws ClassNotFoundException, SQLException {

        String income = null;

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT SUM(`Amount`) AS 'Income' FROM `booking_payment` WHERE `Department`= '" + department + "' AND MONTH(`Date`)= '" + month + "' AND YEAR(`Date`)= '" + year + "'";

            res = st.executeQuery(sql);
            while (res.next()) {
                String tempIncome = res.getString("Income");

                if (tempIncome == null) {
                    income = "00.0";
                } else {
                    income = tempIncome;
                }
            }
        }
        return income;
    }

    //Returns current year, current month total bad debts
    public static String getCurrentYearCurrentMonthTotalDebt(String month, String year) throws ClassNotFoundException, SQLException {

        Float other_exp = 0.0f;
        Float temp_other_exp = 0.0f;

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT SUM(`Amount`) AS 'Total' FROM `bad_debts` WHERE MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "'";

            res = st.executeQuery(sql);

            while (res.next()) {

                temp_other_exp = res.getFloat("Total");
                if (temp_other_exp != 0.0f) {
                    other_exp = temp_other_exp;
                }
            }
        }
        return other_exp.toString();
    }

    //Returns current year, current month income of all departments
    public static String getCurrentYearCurrentMonthAllDepartmentIncome(String month, String year) throws ClassNotFoundException, SQLException {

        Float total_income = 0.0f;
        Float temp_income = 0.0f;

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT SUM(`Amount`) AS 'Total' FROM `booking_payment` WHERE `Status` = 'confirmed' AND MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "'";

            res = st.executeQuery(sql);
            while (res.next()) {

                temp_income = res.getFloat("Total");

                if (!res.equals(0.0f)) {
                    total_income = temp_income;
                }
            }
        }
        return total_income.toString();
    }

    //Returns current year, current month total expenses
    public static String getCurrentYearCurrentMonthAllExpenses(String month, String year) throws ClassNotFoundException, SQLException {

        Float business_exp = 0.0f;
        Float temp_business_exp = 0.0f;

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT SUM(`Amount`) AS 'Total' FROM `business_payment` WHERE MONTH(`Date`) = '" + month + "' AND YEAR(`Date`) = '" + year + "'";

            res = st.executeQuery(sql);
            while (res.next()) {

                temp_business_exp = res.getFloat("Total");

                if (temp_business_exp != 0.0f) {
                    business_exp = temp_business_exp;
                }
            }
        }
        return business_exp.toString();
    }

    //Returns net income before discount diduction for calculation
    public static Float getCurrentYearCurrentMonthNetIncomeBeforeDiscount(String month, String year) throws ClassNotFoundException, SQLException {

        Float temp_income = Float.parseFloat(getCurrentYearCurrentMonthAllDepartmentIncome(month, year));
        Float temp_bad_debts = Float.parseFloat(getCurrentYearCurrentMonthTotalDebt(month, year));
        Float temp_expenses = Float.parseFloat(getCurrentYearCurrentMonthAllExpenses(month, year));;

        net_income_before_discount = temp_income - (temp_expenses + temp_bad_debts);

        return net_income_before_discount;
    }

    //Returns net income before discount diduction (minus figures refactored)
    public static String getIncomeBeforeDiscount(String month, String year) throws ClassNotFoundException, SQLException {

        Float net_income_before_discount = getCurrentYearCurrentMonthNetIncomeBeforeDiscount(month, year);
        String net_income = net_income_before_discount.toString();

        if (net_income_before_discount < 0) {
            return net_income.substring(1);
        } else {
            return net_income;
        }
    }

    //Returns income status (Profit | Loss) for the specified year and month 
    public static String getNetIncomeStatus() {
        return netStatus;
    }

    //Returns discountable amount for the specified year and month for calculation
    public static Float getCurrentYearMonthlyNetDiscountBalance(String month, String year) throws ClassNotFoundException, SQLException {

        Float income_before_discount = getCurrentYearCurrentMonthNetIncomeBeforeDiscount(month, year);
        Float discount_figure = (income_before_discount / 100) * discount_percentage;

        return discount_figure;
    }

    //Returns discountable amount for the specified year and month (minus figures refactored)
    public static String getDiscountFigure(String month, String year) throws ClassNotFoundException, SQLException {

        Float discount_figure = getCurrentYearMonthlyNetDiscountBalance(month, year);
        String temp_discount = discount_figure.toString();

        if (discount_figure < 0) {
            return temp_discount.substring(1);
        } else {
            return temp_discount;
        }
    }

    //Returns net income after discount diduction for calculation
    public static Float getCurrentYearMonthlyNetIncomeAfterDiscount(String month, String year) throws ClassNotFoundException, SQLException {

        Float income_before_discount = getCurrentYearCurrentMonthNetIncomeBeforeDiscount(month, year);
        Float discount = getCurrentYearMonthlyNetDiscountBalance(month, year);

        Float net_income_after_discount = 0.0f;

        return net_income_after_discount = income_before_discount - discount;
    }

    //Returns net income after discount diduction (minus figures refactored)
    public static String getNetIncomeAfterDiscount(String month, String year) throws ClassNotFoundException, SQLException {

        Float temp_income_after_discount = getCurrentYearMonthlyNetIncomeAfterDiscount(month, year);
        String income_after_discount = temp_income_after_discount.toString();

        if (temp_income_after_discount < 0) {
            netStatus = "Loss";
            return income_after_discount.substring(1);
        } else {
            netStatus = "Profit";
            return income_after_discount;
        }
    }

}
