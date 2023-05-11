<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Academics_Profile.Master" AutoEventWireup="true" CodeBehind="Student_Registration.aspx.cs" Inherits="Flex.pages.academics.Student_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="academicsHeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="academicsContentPlaceHolder" runat="server">
    <ul class="mx-3 breadcrumb">
        <li class="breadcrumb-item active">Academics</li>
        <li class="breadcrumb-item active">Student Registration</li>
    </ul>
    <div class="container mt-2">
        <div class="card">
            <div class="card-header">
                <h4>Student Registration Form</h4>
            </div>
            <div class="card-body text-start">
                <form>
                    <div class="mb-3 d-flex w-100">
                        <div class="flex-grow-1 mx-2">
                            <label for="name" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="firstname" required />
                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="name" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="name" required />
                        </div>
                    </div>
                    <div class="mb-3 d-flex w-100">
                        <div class="flex-grow-1 mx-2">
                            <label for="name" class="form-label">Phone</label>
                            <input type="text" class="form-control" id="firstname" required />
                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="name" class="form-label">Cnic</label>
                            <input type="text" class="form-control" id="name" required />
                        </div>
                    </div>
                    <div class="mb-3 d-flex w-100">
                        <div class="flex-grow-1 mx-2">
                            <label for="name" class="form-label">Father Name</label>
                            <input type="text" class="form-control" id="firstname" required />
                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="name" class="form-label">Guardian Name</label>
                            <input type="text" class="form-control" id="name" required />
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" required>
                    </div>
                    <div class="mb-3 d-flex w-100">
                        <div class="flex-grow-1 mx-2">
                            <label for="dob" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" id="dob" required>
                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="gender" class="form-label">Gender</label>
                            <select class="form-select" id="gender" required>
                                <option selected disabled value="">Choose...</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Other</option>
                            </select>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <textarea class="form-control" id="address" rows="1" required></textarea>
                    </div>
                    <div class="mb-3 d-flex w-100">
                        <div class="flex-grow-1 mx-2">
                            <label for="department" class="form-label">Department</label>
                            <select class="form-select" id="department" required>
                                <option selected disabled value="">Choose...</option>
                                <option>Computer Sciences</option>
                                <option>Data Sciences</option>
                                <option>Artificial Intelligence</option>
                                <option>Software Engineering</option>
                                <option>Cyber Security</option>
                                <option>Electrical Engineering</option>
                                <option>Business Administration</option>
                                <!-- Add more departments as needed -->
                            </select>
                        </div>
                        <div class="flex-grow-1 mx-2">
                            <label for="department" class="form-label">Available Section</label>
                            <select class="form-select" id="department" required>
                                <option selected disabled value="">Choose...</option>
                                <option>A</option>
                                <option>B</option>
                                <option>C</option>
                                <option>D</option>
                                <option>E</option>
                                <option>F</option>
                                <option>G</option>
                                <!-- Add more departments as needed -->
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg rounded-5" style="width: 20rem;">Enroll</button>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="academicsScriptPlaceHolder" runat="server">
</asp:Content>
