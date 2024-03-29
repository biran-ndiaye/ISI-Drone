<%@page import="entities.User"%>
<%@page import="action.ActionCategory"%>
<%@page import="java.util.ArrayList, entities.Category"%>
<%
    //V�rification si la cat�gorie s�lectionne est valide (Un utilisateur pourrait tenter d'entr� une cat�gorie invalide dans la barre d'adresse)
    @SuppressWarnings(  "unchecked")

    User user = (User) session.getAttribute("user");

    if (user != null && user.getUserType() == 1) {
        //R�cup�ration des cat�gories
        ActionCategory.getCategories(request, response);
    } else {
        //R�cup�ration des cat�gories pour client
        ActionCategory.getClientCategories(request, response);
    }
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
    int categorySelected = ActionCategory.getSelectedCategory(request, response);
    if (categories != null) {
        if (categories.size() > 0) {
            for (Category category : categories) {
%>
<a href="items?category=<%=category.getId()%>" class="list-group-item<%=(category.getId() == categorySelected ? " active" : "")%>"><%=category.getName()%></a>
<%
    }
} else {
%>
Aucune Cat�gorie n'est pr�sente pour le moment.
<%
        }
    }
%>