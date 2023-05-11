<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Student_Profile.Master" AutoEventWireup="true" CodeBehind="Course_Feedback.aspx.cs" Inherits="Flex.pages.students.Course_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="studentHeadPlaceHolder" runat="server">
    <style>
        .table-custom th {
            position: sticky;
            top: 0;
            color: white;
            background-color: #0d6efd;
        }

        .table-custom {
            overflow: scroll;
            max-height: 60vh;
        }

        .div-custom {
            max-height: 65vh;
            overflow: auto;
        }

        .scrollable-div {
            max-height: 250px;
            overflow-y: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studentContentPlaceHolder" runat="server">
    <div class="sticky-top bg-white">
        <ul class="mx-3 breadcrumb">
            <li class="breadcrumb-item active">Student</li>
            <li class="breadcrumb-item active">Course feedback</li>
        </ul>
        <nav class="navbar navbar-expand-lg bg-light rounded-5">
            <div class="container-fluid">
                <a class="navbar-brand mx-2" href="#">Courses</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse d-flex" id="navbarNavAltMarkup">
                    <div runat="server" id="linkbuttons" class="navbar-nav">
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-secondary rounded-5" OnClick="fetchAttendance" Text="MT-1001" />
                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-link nav-link" OnClick="fetchAttendance" Text="CS-1001" />
                        <asp:Button ID="Button3" runat="server" CssClass="btn btn-link nav-link" OnClick="fetchAttendance" Text="CL-1002" />
                        <asp:Button ID="Button4" runat="server" CssClass="btn btn-link nav-link" OnClick="fetchAttendance" Text="EE-1004" />
                    </div>
                </div>
            </div>
        </nav>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="studentScriptPlaceHolder" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var homeLink = document.getElementById('btnCFeedback');
            homeLink.classList.add('active');
        });
    </script>
</asp:Content>

