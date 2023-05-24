<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div>
        <h1>Students Details </h1>
        <div>
            <table class="table">
                <tr>
                    <th>First Name</th>
                    <td>
                        <asp:TextBox runat="server" ID="firstID" CssClass="form-control"></asp:TextBox></td>
                </tr>

                <tr>
                    <th>Last Name</th>
                    <td>
                        <asp:TextBox runat="server" ID="lastID" CssClass="form-control"></asp:TextBox></td>
                </tr>
                <%--<tr>
                    <th>Age</th>
                    <td><asp:TextBox  runat="server" ID="ageID" CssClass="form-control"></asp:TextBox></td>
                </tr>--%>
                <tr>
                    <th>Pending Fees</th>
                    <td>
                        <asp:TextBox runat="server" ID="numberID" CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button runat="server" ID="btnnew" Text="New" CssClass="btn btn-primary btn-sm" OnClick="btnnew_Click"></asp:Button>
                    </td>
                    <td>
                        <asp:Button runat="server" ID="btnsubmit" Text="Submit" CssClass="btn btn-success btn-sm" OnClick="btnsubmit_Click"></asp:Button>
                    </td>
                    
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>

        <div>
            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-CssClass="ID" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" ItemStyle-CssClass="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" ItemStyle-CssClass="LastName" />
                    <asp:BoundField DataField="Number" HeaderText="Pending Fees" ItemStyle-CssClass="PendingFees" />
                    <asp:TemplateField HeaderText="View">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkView" runat="server" Text="View"  />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div id="dialog" style="display: none">
                <b>ID:</b> <span id="ID"></span>
                <br />
                <b>First Name:</b> <span id="FirstName"></span>
                <br />
                <b>Last Name:</b> <span id="LastName"></span>  
                <br />
                <b>Pending Fees:</b> <span id="Number"></span>
            </div>
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
            <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
            <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
                rel="stylesheet" type="text/css" />
            <script type="text/javascript">
                $(document).on("click", "[id*=lnkView]", function () {
                    $("#ID").html($(".ID", $(this).closest("tr")).html());
                    $("#FirstName").html($(".FirstName", $(this).closest("tr")).html());
                    $("#LastName").html($(".LastName", $(this).closest("tr")).html());
                    $("#Number").html($(".PendingFees", $(this).closest("tr")).html());
                    $("#dialog").dialog({
                        title: "View Details",
                        buttons: {
                            Ok: function () {
                                $(this).dialog('close');
                            }
                        },
                        modal: true
                    });
                    return false;
                });
            </script>
        </div>
    </div>
</asp:Content>
