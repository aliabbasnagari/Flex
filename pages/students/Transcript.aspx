<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Student_Profile.Master" AutoEventWireup="true" CodeBehind="Transcript.aspx.cs" Inherits="Flex.pages.students.Transcript" %>

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
            max-height: 250px; /* Set the desired height */
            overflow-y: auto; /* Enable vertical scrolling */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studentContentPlaceHolder" runat="server">
    <div class="sticky-top bg-white">
        <ul class="mx-3 breadcrumb">
            <li class="breadcrumb-item active">Student</li>
            <li class="breadcrumb-item active">Transcript</li>
        </ul>
        <nav class="navbar navbar-expand-lg bg-light rounded-5">
            <div class="container-fluid">
                <a class="navbar-brand mx-2" href="#">Semesters</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse d-flex" id="navbarNavAltMarkup">
                    <div runat="server" id="semesterButtons" class="navbar-nav">
                    </div>
                </div>
            </div>
        </nav>

        <div class="mx-5 mt-3 div-custom">
            <asp:GridView ID="transcriptGrid" runat="server" AutoGenerateColumns="True" CssClass="table table-custom table-sm table-bordered border-primary table-hover">
            </asp:GridView>
        </div>

        <div class="m-5">
            <label for="gpaLabel" class="form-label">SGPA</label>
            <asp:Label ID="gpaLabel" CssClass="form-control fs-3" runat="server" Text="SGPA"></asp:Label>
        </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="studentScriptPlaceHolder" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var homeLink = document.getElementById('btnTrans');
            homeLink.classList.add('active');
        });
    </script>
</asp:Content>
