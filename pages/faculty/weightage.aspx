<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Faculty_Profile.Master" AutoEventWireup="true" CodeBehind="weightage.aspx.cs" Inherits="Flex.pages.faculty.weightage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="facultyHeadPlaceHolder" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="facultyContentPlaceHolder" runat="server">
    <ul class="mx-3 breadcrumb">
        <li class="breadcrumb-item active">Faculty</li>
        <li class="breadcrumb-item active">Weightages</li>
    </ul>
    <nav class="navbar navbar-expand-lg bg-light rounded-5">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h1 mx-3">Courses</span>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCourses" aria-controls="navbarCourses" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse d-flex" id="navbarCourses">
                <div runat="server" id="courseButtons" class="navbar-nav">
                </div>
            </div>
        </div>
    </nav>

    <div class="mb-3">
        <label for="assiWeight" class="form-label">Assignment</label>
        <asp:TextBox runat="server" ID="assiWeight" CssClass="form-control" TextMode="Number" Text="-"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label for="assiWeight" class="form-label">Quiz</label>
        <asp:TextBox runat="server" ID="quizWeight" CssClass="form-control" TextMode="Number" Text="-"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label for="assiWeight" class="form-label">Sessional-I</label>
        <asp:TextBox runat="server" ID="sess1Weight" CssClass="form-control" TextMode="Number" Text="-"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label for="assiWeight" class="form-label">Sessional-II</label>
        <asp:TextBox runat="server" ID="sess2Weight" CssClass="form-control" TextMode="Number" Text="-"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label for="assiWeight" class="form-label">Project</label>
        <asp:TextBox runat="server" ID="projWeight" CssClass="form-control" TextMode="Number" Text="-"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label for="assiWeight" class="form-label">Final Exam</label>
        <asp:TextBox runat="server" ID="examWeight" CssClass="form-control" TextMode="Number" Text="-"></asp:TextBox>
    </div>
    <asp:LinkButton ID="btnSetWeights" runat="server" CssClass="btn btn-success btn-lg rounded-5 btn-enroll" OnClick="btnSetWeights_Click">
        <i class="fa fa-check mx-2"></i>Set Weightage
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="facultyScriptPlaceHolder" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var homeLink = document.getElementById('btnAttend');
            homeLink.classList.add('active');
        });
    </script>
</asp:Content>
