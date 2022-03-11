<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </head>
    <body>

        <div class="container-fluid my-4">
            <div class="row justify-content-center">

                <div class="col-2">

                    <!-- Add new user -->
                    <div class="row border rounded py-3 mb-3">
                        <h3>Add new user</h3>
                        <form action="user" method="post">
                            <fieldset name="add-field">
                                <input class="mb-2" type="email" name="new-email" placeholder="email" required><br>
                                <input class="mb-2" type="text" name="new-pass" placeholder="password" required>
                                <input class="mb-2" type="text" name="new-fname" placeholder="first name" required>
                                <input class="mb-2" type="text" name="new-lname" placeholder="last name" required>
                                <select class="w-75 mb-2" name="new-role" required>
                                    <option value="" hidden>---</option>
                                    <c:forEach var="role" items="${roles}">
                                        <option value="${role.id}">${role.name}</option>
                                    </c:forEach>
                                </select>
                                <button type="submit" name="btn" value="add" class="btn btn-primary btn-sm w-75">Add New User</button>
                            </fieldset>
                        </form>
                    </div>

                    <!-- Edit existing user -->
                    <div class="row border rounded py-3 mb-3">
                        <h3>Edit user</h3>
                        <form action="user" method="post">
                            <input class="mb-2" type="email" name="email-to-edit" placeholder="email" required>
                            <input class="mb-2" type="text" name="edited-fname" placeholder="first name">
                            <input class="mb-2" type="text" name="edited-lname" placeholder="lastname">
                            <select class="w-75 mb-2" name="edited-role">
                                <option value="" hidden>---</option>
                                <c:forEach var="role" items="${roles}">
                                    <option value="${role.id}">${role.name}</option>
                                </c:forEach>
                            </select>
                            <button type="submit" name="btn" value="save" class="btn btn-success btn-sm w-75 mb-2">Save</button>
                        </form>
                        <form action="user" method="post">
                            <button type="submit" name="btn" value="cancel" class="btn btn-secondary btn-sm w-75">Cancel</button>
                        </form>
                    </div>
                </div>

                <!-- User list -->
                <div class="col-9 ms-3 py-2 px-4">
                    <h1>Rei's User Management System</h1>
                    <div class="text-danger">${message}</div>
                    <form action="user" method="post">
                        <table class="table">

                            <thead>
                            <th>Email</th>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Role</th>
                            <!--<th class="text-center">Edit</th>-->
                            <th class="text-center">Delete</th>
                            </thead>

                            <tbody var="body">
                                <c:forEach var="user" items="${users}">
                                    <tr class="align-middle">
                                        <td>${user.email}</td>
                                        <td>${user.firstName}</td>
                                        <td>${user.lastName}</td>
                                        <td>${user.role.name}</td>

                                        <!-- Delete button -->
                                        <td class="text-center col-1">
                                            <button type="submit" name="btn" value="delete" class="border-0 bg-transparent link-secondary">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                                </svg>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
