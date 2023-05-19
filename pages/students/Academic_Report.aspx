<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Student_Profile.Master" AutoEventWireup="true" CodeBehind="Academic_Report.aspx.cs" Inherits="Flex.pages.students.Academic_Report" %>

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
            <li class="breadcrumb-item active">Attendance</li>
        </ul>
        <nav class="navbar navbar-expand-lg bg-light rounded-5">
            <div class="container-fluid">
                <a class="navbar-brand mx-2" href="#">Courses</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse d-flex" id="navbarNavAltMarkup">
                    <div runat="server" id="courseButtons" class="navbar-nav">
                    </div>
                </div>
            </div>
        </nav>
    </div>

    <!-- Accordion -->
    <div class="accordion m-5" id="accordionPanelsStayOpenExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                    Assignments
                </button>
            </h2>
            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                <div class="accordion-body scrollable-div">
                    <div class="mx-5 mt-3 div-custom">
                        <asp:GridView ID="assignmentsGrid" runat="server" AutoGenerateColumns="True" CssClass="table table-custom table-sm table-bordered border-primary table-hover">
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                    Quizzes
                </button>
            </h2>
            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                <div class="accordion-body scrollable-div">
                    <div class="mx-5 mt-3 div-custom">
                        <asp:GridView ID="quizzesGrid" runat="server" AutoGenerateColumns="True" CssClass="table table-custom table-sm table-bordered border-primary table-hover">
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                    Sessionals
                </button>
            </h2>
            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                <div class="accordion-body scrollable-div">
                    <asp:GridView ID="sessionalsGrid" runat="server" AutoGenerateColumns="True" CssClass="table table-custom table-sm table-bordered border-primary table-hover">
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingFour">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
                    Project
                </button>
            </h2>
            <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFour">
                <div class="accordion-body scrollable-div">
                    <asp:GridView ID="projectGrid" runat="server" AutoGenerateColumns="True" CssClass="table table-custom table-sm table-bordered border-primary table-hover">
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingFive">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseFive">
                    Final
                </button>
            </h2>
            <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFive">
                <div class="accordion-body scrollable-div">
                    <asp:GridView ID="finalGrid" runat="server" AutoGenerateColumns="True" CssClass="table table-custom table-sm table-bordered border-primary table-hover">
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <!-- Accordion END -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="studentScriptPlaceHolder" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var homeLink = document.getElementById('btnAReport');
            homeLink.classList.add('active');
        });
    </script>
</asp:Content>
