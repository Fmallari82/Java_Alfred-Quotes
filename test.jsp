<table class="table table-striped table-primary my-3">
    <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author Name</th>
            <th>Owner</th>
            <th>Actions</th>
        </tr>
    <tbody>
        <c:forEach items="${unborrowed}" var="book">
            <c:if test="${book.borrower.id == null }">
                <tr class="table-light">
                    <td>${book.id}</td>
                    <td><a href="books/${book.id}"> <c:out
                                value="${book.title}" />
                    </a></td>
                    <td>${book.author}</td>
                    <td>${book.user.userName}</td>
                    <td class="d-flex"><c:choose>
                            <c:when test="${loggedInUser.id == book.user.id && book.borrower.id == null}">
                                <a href="/books/edit/${book.id}" class="btn btn-info mx-1 px-4">Edit</a>
                                <form:form action="books/delete/${book.id}" method="delete">
                                    <input type="submit" value="Delete" class="btn btn-danger">
                                </form:form>
                            </c:when>
                            <c:when test="${loggedInUser.id != book.user.id && borrower.id == null}">
                                <a href="/books/add/${book.id}" class="btn btn-success mx-1">Borrow</a>
                            </c:when>
                            <c:otherwise>
                                <strong>BORROWED</strong>
                            </c:otherwise>
                        </c:choose></td>
                </tr>
            </c:if>
        </c:forEach>
    </tbody>
</table>

<h5 class="my-2">Books I'm Borrowing</h5>
<table class="table table-striped table-primary my-3">
    <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author Name</th>
            <th>Owner</th>
            <th>Actions</th>
        </tr>
    <tbody>
        <c:forEach items="${borrowed}" var="book">

                <tr class="table-light">
                    <td>${book.id}</td>
                    <td><a href="books/${book.id}"> <c:out value="${book.title}"/></a></td>
                    <td>${book.author}</td>
                    <td>${book.user.userName}</td>
                    <td class="d-flex">
                        <a href="books/remove/${book.id}" class="btn btn-success mx-1">Return</a>
                    </td>
                </tr>

        </c:forEach>
    </tbody>
</table>
