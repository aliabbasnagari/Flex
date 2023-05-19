<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Academics_Profile.Master" AutoEventWireup="true" CodeBehind="Faculty_Registration.aspx.cs" Inherits="Flex.pages.academics.Faculty_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="academicsHeadPlaceHolder" runat="server">
    <style>
        .btn-enroll {
            width: 15rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="academicsContentPlaceHolder" runat="server">
    <ul class="mx-3 breadcrumb">
        <li class="breadcrumb-item active">Academics</li>
        <li class="breadcrumb-item active">Faculty Registration</li>
    </ul>
    <div class="container mt-2">
        <div class="card">
            <div class="card-header">
                <h4>Faculty Registration Form</h4>
            </div>
            <div class="card-body text-start">
                <form>
                    <div class="mb-3 d-flex w-100">
                        <div class="flex-grow-1 mx-2">
                            <label for="fName" class="form-label">First Name</label>
                            <asp:TextBox runat="server" ID="fName" CssClass="form-control" Required="true"></asp:TextBox>
                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="lName" class="form-label">Last Name</label>
                            <asp:TextBox runat="server" ID="lName" CssClass="form-control" Required="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 d-flex w-100">
                        <div class="flex-grow-1 mx-2">
                            <label for="phNumber" class="form-label">Phone</label>
                            <asp:TextBox runat="server" ID="phNumber" CssClass="form-control" Required="true"></asp:TextBox>
                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="userCnic" class="form-label">Cnic</label>
                            <asp:TextBox runat="server" ID="userCnic" CssClass="form-control" Required="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 d-flex w-100">
                        <div class="flex-grow-1 mx-2">
                            <label for="ftName" class="form-label">Father Name</label>
                            <asp:TextBox runat="server" ID="ftName" CssClass="form-control" Required="true"></asp:TextBox>
                        </div>
                        <!--
                        <div class="flex-grow-1 mx-2">
                            <label for="guName" class="form-label">Guardian Name</label>
                            <asp:TextBox runat="server" ID="guName" CssClass="form-control" Required="true"></asp:TextBox>
                        </div>
                        -->
                    </div>
                    <div class="mb-3 d-flex w-100">
                        <div class="flex-grow-1 mx-2">
                            <label for="uEmail" class="form-label">Email Address</label>
                            <asp:TextBox runat="server" ID="uEmail" CssClass="form-control" TextMode="Email" Required="true"></asp:TextBox>
                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="uDob" class="form-label">Date of Birth</label>
                            <asp:TextBox runat="server" ID="uDob" CssClass="form-control" TextMode="Date" Required="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="mb-3 d-flex w-100">
                        <div class="flex-grow-1 mx-2">
                            <label for="uNation" class="form-label">Nationality</label>
                            <asp:TextBox runat="server" ID="uNation" CssClass="form-control" Required="true"></asp:TextBox>
                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="ddGender" class="form-label">Gender</label>
                            <asp:DropDownList ID="ddGender" runat="server" CssClass="form-select" required="true">
                                <asp:ListItem Text="Choose..." Value="" Disabled="true" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Others" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="mb-3 d-flex w-100">
                        <div class="flex-grow-1 mx-2">
                            <label for="uAddress" class="form-label">Address</label>
                            <asp:TextBox ID="uAddress" runat="server" CssClass="form-control" Rows="1" TextMode="MultiLine" required="true"></asp:TextBox>
                        </div>
                        <div class="flex-grow-2 mx-2">
                            <label for="uCity" class="form-label">City</label>
                            <asp:TextBox ID="uCity" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                        </div>
                        <div class="flex-grow-2 mx-2">
                            <label for="uCountry" class="form-label">Country</label>
                            <asp:TextBox ID="uCountry" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 d-flex w-100">
                        <div class="flex-grow-1 mx-2">
                            <label for="ddCampus" class="form-label">Campus</label>
                            <asp:DropDownList ID="ddCampus" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddCampus_Selected" AutoPostBack="true" required="true">
                                <asp:ListItem Text="Choose..." Value="" Disabled="true" Selected="true"></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="ddCourse" class="form-label">Course 1</label>
                            <asp:DropDownList ID="ddCourse1" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddCourse_Selected1" AutoPostBack="true" required="true">
                                <asp:ListItem Text="Choose..." Value="" Disabled="true" Selected="true"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="ddCourse" class="form-label">Course 2</label>
                            <asp:DropDownList ID="ddCourse2" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddCourse_Selected2" AutoPostBack="true">
                                <asp:ListItem Text="Choose..." Value="" Disabled="true" Selected="true"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="ddCourse" class="form-label">Course 3</label>
                            <asp:DropDownList ID="ddCourse3" runat="server" CssClass="form-select" AutoPostBack="true">
                                <asp:ListItem Text="Choose..." Value="" Disabled="true" Selected="true"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="ddSections" class="form-label">Sections</label>
                            <asp:DropDownList ID="ddSections" runat="server" CssClass="form-select" required="true">
                                <asp:ListItem Text="Choose..." Value="" Disabled="true" Selected="true"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="mb-3 d-flex w-100 align-items-end">
                        <div class="flex-grow-1 mx-2">
                            <label for="nuEmail" class="form-label">NU Email address</label>
                            <asp:TextBox runat="server" ID="nuEmail" CssClass="form-control" TextMode="Email" Text="AutoGenerate@nu.edu.pk" Required="true"></asp:TextBox>
                        </div>
                        <div class="mx-2">
                            <asp:Button ID="btnGenerate" runat="server" CssClass="btn btn-secondary" OnClick="btnGenerate_Click" CausesValidation="false" Text="Generate" />
                        </div>
                    </div>
                    <asp:LinkButton ID="btnEnroll" runat="server" CssClass="btn btn-success btn-lg btn-enroll rounded-5" OnClick="btnEnroll_Click">
                        <i class="fa fa-check mx-2"></i>Enroll
                    </asp:LinkButton>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="academicsScriptPlaceHolder" runat="server">
</asp:Content>
