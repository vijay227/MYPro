  <% 
             session.removeAttribute("userName");
        	session.removeAttribute("AdminLogin");
          
            response.setHeader("Cache-Control","no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma","no-cache");
            response.setDateHeader("Expires",0);
           if (session.getAttribute("userName") == null || session.getAttribute("AdminLogin")== null) {  
            response.sendRedirect(request.getContextPath()+"/index.jsp");
           }
    %>