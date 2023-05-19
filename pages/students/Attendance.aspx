<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Student_Profile.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="Flex.pages.students.Attendance" %>
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

        .progress-custom {
            height: 25px;
            font-size: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studentContentPlaceHolder" runat="server">
    <ul class="mx-3 breadcrumb">
        <li class="breadcrumb-item active">Student</li>
        <li class="breadcrumb-item active">Attendance</li>
    </ul>
    <nav class="navbar navbar-expand-lg bg-light rounded-5">
        <div class="container-fluid">
            <a class="navbar-brand mx-2" href="#">Courses</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse d-flex" id="navbarNavAltMarkup">
                <div runat="server" id="linkbuttons" class="navbar-nav">
                </div>
            </div>
        </div>
    </nav>

    <div class="progress progress-custom mx-5 mt-3">
        <div runat="server" id="attendanceProgress" class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" aria-label="Animated striped example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
    </div>

    <div class="mx-5 mt-3 div-custom">
        <asp:GridView ID="attendanceGrid" runat="server" AutoGenerateColumns="True" CssClass="table table-custom table-sm table-bordered border-primary table-hover">
        </asp:GridView>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="studentScriptPlaceHolder" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var homeLink = document.getElementById('btnAttend');
            homeLink.classList.add('active');
        });
    </script>
</asp:Content>
