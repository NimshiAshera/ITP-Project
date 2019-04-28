<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="<%= request.getContextPath()%>/Spa/Admin/index.jsp">Tour Management</a>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap pt-0">

            </div> <!-- Default dropleft button -->
            <div class="btn-group dropleft">
                <button type="button" class="btn btn-link text-white dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration: none">
                    ${username}
                </button>
                <div class="dropdown-menu bg-dark text-white">
                    <a class="pl-5 text-white" style="background-color: transparent; text-decoration: none" href="<%=request.getContextPath()%>/LogoutServelet">Sign out</a>
                </div>
            </div>

        </li>
    </ul>
</nav>