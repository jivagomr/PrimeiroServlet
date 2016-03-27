<%-- 
    Document   : index
    Created on : 04/03/2016, 21:25:09
    Author     : Jivago
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
        
        <script>
            
            $(document).ready(
                function () {
                    $("#form-dados").on("submit",
                        function () {
                            carregarDados();
                            return false;
                        }
                    );
                }
            );
            
            function renderResposta(json) {
                $("body")
                .append("<p>"+json.seuNome+" - "
                        +json.seuEmail+"</p>");

                $("#sel-cidades").html('');

                for (i in json.cidades) {
                    //$("#lista-cidades").append("<p>"+json.cidades[i].codigo+" - "+json.cidades[i].nome+"</p>");
$("#sel-cidades")
.append("<option value='"+json.cidades[i].codigo+"'>"
+json.cidades[i].nome+"</option>");               }                
            }
            
            function carregarDados() {
                $.ajax(
                        {
                            type : "POST",
                            url : "ServletJSON",
                            cache : false,
                            beforeSend: function () {
                                $("#loading").toggle();
                            },
                            data : { nome : $("#txt-nome").val(),
                                     email : $("#txt-email").val(),
                                     estado : $("#sel-estados").val()
                                    },
                            dataType : "json",
                            success : function(json) {
                                renderResposta(json);
                            }
                            ,
                            error : function () {
                                alert("erro executando requisicao");
                            },
                            complete: function () {
                                $("#loading").toggle();
                            }                            
                        }
                );
            }
            
            
        </script>
        
    </head>
    <body>
        <h1>Hello World!</h1>
        &nbsp;
        <% 
            DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL);
            //String s = dateFormat.format(new Date()); 
String s = 
    new SimpleDateFormat("dd-MM-yyyy HH:mm:ss.SSS").format(new Date()); 
            out.println("Hoje eh: "+s);            
        %>
        
        <form id="form-dados" action="ServletJSON" method="POST">
            Nome: <input id="txt-nome" type="text" name="nome" />
            <br />
            E-mail <input id="txt-email" type="text" name="email" />
            <br />
            Estado:
            <br />
            <select id="sel-estados" name="estado">
                    <option value="">Selecione</option>
                    <option value="AC">Acre</option>
                    <option value="AL">Alagoas</option>
                    <option value="AP">Amap&aacute;</option>
                    <option value="AM">Amazonas</option>
                    <option value="BA">Bahia</option>
                    <option value="CE">Cear&aacute;</option>
                    <option value="DF">Distrito Federal</option>
                    <option value="ES">Espirito Santo</option>
                    <option value="GO">Goi&aacute;s</option>
                    <option value="MA">Maranh&atilde;o</option>
                    <option value="MS">Mato Grosso do Sul</option>
                    <option value="MT">Mato Grosso</option>
                    <option value="MG">Minas Gerais</option>
                    <option value="PA">Par&aacute;</option>
                    <option value="PB">Para&iacute;ba</option>
                    <option value="PR">Paran&aacute;</option>
                    <option value="PE">Pernambuco</option>
                    <option value="PI">Piau&iacute;</option>
                    <option value="RJ">Rio de Janeiro</option>
                    <option value="RN">Rio Grande do Norte</option>
                    <option value="RS">Rio Grande do Sul</option>
                    <option value="RO">Rond&ocirc;nia</option>
                    <option value="RR">Roraima</option>
                    <option value="SC">Santa Catarina</option>
                    <option value="SP">S&atilde;o Paulo</option>
                    <option value="SE">Sergipe</option>
                    <option value="TO">Tocantins</option>
            </select>
            <button type="submit">Carregar</button>
            <br />
            <select id="sel-cidades">
                <option>- selecione um estado -</option>
            </select>
            <div id="loading" style="display: none">
                <img src="img/loading.gif" />Carregando...
            </div>
        </form>
        
        <div id="lista-cidades"></div>
        
    </body>
</html>
