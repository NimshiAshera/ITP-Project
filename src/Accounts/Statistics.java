package Accounts;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Statistics {

    private static String sql;
    private static ResultSet res;
    private static String netStatus = null;

    public static String getTotalMonthlyIncome() throws ClassNotFoundException, SQLException {

        String income = null;

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT SUM(`Amount`) AS 'Income' FROM `booking_payment` WHERE MONTH(`Date`) = MONTH(CURRENT_DATE()) AND YEAR(`Date`) = YEAR(CURRENT_DATE())";

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

    public static String getTotalMonthlyExpenses() throws ClassNotFoundException, SQLException {

        String expenses = null;

        if (Connect.getInstance() != null) {

            Connection con = Connect.getConnction();
            Statement st = con.createStatement();

            sql = "SELECT SUM(`Amount`) AS Expenses FROM `business_payment` WHERE MONTH(`Date`) = MONTH(CURRENT_DATE()) AND YEAR(`Date`) = YEAR(CURRENT_DATE())";

            res = st.executeQuery(sql);
            while (res.next()) {
                String tempIncome = res.getString("Expenses");

                if (tempIncome == null) {
                    expenses = "00.0";
                } else {
                    expenses = tempIncome;
                }
            }
        }
        return expenses;
    }

//    public static String getMonthlyNetIncomeStatAfterDiscount(String month, String year) throws ClassNotFoundException, SQLException {
//
//        
//
//        return net_income;
//    }

}
