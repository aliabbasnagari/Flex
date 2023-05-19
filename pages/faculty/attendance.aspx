<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Faculty_Profile.Master" AutoEventWireup="true" CodeBehind="attendance.aspx.cs" Inherits="Flex.pages.faculty.attendance" %>

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
        <li class="breadcrumb-item active">Attendance</li>
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

    <div class="mb-3 d-flex w-100 align-items-end">
        <div class="flex-grow-1 mx-2">
            <label for="uDob" class="form-label">Attendance Date</label>
            <asp:TextBox runat="server" ID="aDate" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>
        <div class="flex-grow-1 mx-2">
            <label for="ddSections" class="form-label">Sections</label>
            <asp:DropDownList ID="ddSections" runat="server" CssClass="form-select">
                <asp:ListItem Text="Choose..." Value="" Disabled="true" Selected="true"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="flex-grow-2 mx-2">
            <asp:LinkButton ID="showAttendance" runat="server" CssClass="btn btn-secondary rounded-5" OnClick="showAttendance_Click">
                        <i class="fa fa-calendar-alt mx-2"></i>Get Attendance
            </asp:LinkButton>
        </div>

        <div class="flex-grow-2 mx-2">
            <asp:LinkButton ID="addAttendance" runat="server" CssClass="btn btn-primary rounded-5" OnClick="addAttendance_Click">
                        <i class="fa fa-plus mx-2"></i>Add Todays Attendance
            </asp:LinkButton>
        </div>
    </div>

    <div class="mx-5 mt-3 div-custom">
        <asp:GridView ID="attendanceGrid" runat="server" AutoGenerateColumns="False" CssClass="table table-custom table-sm table-bordered border-primary table-hover">
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date" />
                <asp:BoundField DataField="Rollno" HeaderText="Roll No" />
                <asp:BoundField DataField="Student Name" HeaderText="Student Name" />
                <asp:TemplateField HeaderText="Presence">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlPresence" runat="server" CssClass="form-control text-center border-0" SelectedValue='<%# Eval("Presence") %>'>
                            <asp:ListItem Value="-">-</asp:ListItem>
                            <asp:ListItem Value="P">P</asp:ListItem>
                            <asp:ListItem Value="L">L</asp:ListItem>
                            <asp:ListItem Value="A">A</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="flex-grow-2 mx-2">
        <asp:LinkButton ID="btnUpdateAttendance" runat="server" CssClass="btn btn-success rounded-5" OnClick="btnUpdateAttendance_Click">
                        <i class="fa fa-sync-alt mx-2"></i>Update
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="facultyScriptPlaceHolder" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var homeLink = document.getElementById('btnAttend');
            homeLink.classList.add('active');
        });
    </script>
</asp:Content>
