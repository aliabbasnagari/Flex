<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Admin_Profile.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Flex.pages.academics.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="studentHeadPlaceHolder" runat="server">
    <style>
        .table-custom {
            width: 30%;
            font-weight: 500;
        }

        .table-label {
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studentContentPlaceHolder" runat="server">
    <ul class="mx-3 breadcrumb">
        <li class="breadcrumb-item active" aria-current="page">Faculty</li>
        <li class="breadcrumb-item active" aria-current="page">Profile</li>
    </ul>
    <div>
        <div class="m-3 p-3 rounded-3 border border-1 shadow-sm">
            <div class="w-100">
                <h4>Personal Information</h4>
            </div>
            <hr />
            <table class="table bg-white text-start table-borderless table-layout-fixed">
                <tbody>
                    <tr>
                        <td class="table-custom">Gender:
                            <asp:Label ID="lbGender" CssClass="table-label" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td></td>
                        <td class="table-custom">DOB:
                            <asp:Label ID="lbDob" CssClass="table-label" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td></td>
                        <td class="table-custom">Blood Group:
                            <asp:Label ID="lbBloodGroup" CssClass="table-label" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-custom">Mobile No:
                            <asp:Label ID="lbMobNo" CssClass="table-label" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td></td>
                        <td class="table-custom">Email:
                            <asp:Label ID="lbEmail" CssClass="table-label" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td></td>
                        <td class="table-custom">Cnic:
                            <asp:Label ID="lbCnic" CssClass="table-label" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-custom">Nationality:
                            <asp:Label ID="lbNation" CssClass="table-label" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td></td>
                        <td class="table-custom"></td>
                        <td></td>
                        <td class="table-custom"></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="m-3 p-3 rounded-3 border border-1 shadow-sm">
            <div class="w-100">
                <h4>Contact Information</h4>
            </div>
            <hr />
            <table class="table bg-white text-start table-borderless table-layout-fixed">
                <tbody>
                    <tr>
                        <td style="width: 45%;">Address:</td>
                        <td></td>
                        <td style="width: 45%;">Address:</td>
                    </tr>
                    <tr>
                        <td style="width: 45%;">Home Phone:</td>
                        <td></td>
                        <td style="width: 45%;">Home Phone:</td>
                    </tr>
                    <tr>
                        <td style="width: 45%;">Postal Code:</td>
                        <td></td>
                        <td style="width: 45%;">Postal Code:</td>
                    </tr>
                    <tr>
                        <td style="width: 45%;">City:</td>
                        <td></td>
                        <td style="width: 45%;">City:</td>
                    </tr>
                    <tr>
                        <td style="width: 45%;">Country:</td>
                        <td></td>
                        <td style="width: 45%;">Country:</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <a href="#" class="btn btn-secondary btn-lg btn-chat rounded-5 position-absolute bottom-0 end-0 m-3"><i class="fas fa-comment"></i>
    </a>
</asp:Content>
<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="studentScriptPlaceHolder">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var homeLink = document.getElementById('btnProfile');
            homeLink.classList.add('active');
        });
    </script>
</asp:Content>
