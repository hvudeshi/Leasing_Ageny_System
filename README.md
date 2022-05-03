# README

<h2>Leasing Agency System</h2>

<h3>Objective:</h3>
<p>Create a leasing agency system that can handle any transaction between the property, the leasing agent, and the applicant/customer</p>

<h3>Software Requirements:</h3>
<ul>
    <li>Ruby version: ruby-3.0.2</li>
    <li>Rails Version: 6.1.4.1</li>
    <li>Database: SQLLite 1.4</li>
</ul>

<h3>Testing application:</h3>
<b>Admin credentials:</b>
<ul>
    <li>Email address: admin@123.com</li>
    <li>Password: 12345</li>
</ul>
<b>VCL Image link: http://152.7.176.24:8080/ </b> <br>

<b>Application Status:</b>
<ul>
<li>Applied - Default status when an application is created.</li>
<li>Checkin - When an agent/admin assigns the property to an applicant.</li>
<li>Rejected - When an agent/admin rejects an application.</li>
<li>Checkout - When an applicant moves out of the property.</li>
<li>Withdraw - When an applicant withdraws an application.</li>
</ul>

<b> Features:</b>

<b>1. Agent View Testing:</b>
<ul>
    <li>Create a new Agent before login.</li>
    <li>Signup button on home page can be used to create new Agent.</li>
    <li>During signup, you need to select user_type as Agent from the drop down.</li>
    <li>Only unique Email is allowed while sign up.</li>
    <li>Email,password, name, address are mandatory fields while signup.</li>
    <li>Leasing Agent can add new property, view the list of applications and properties from his home page.</li>
    <li>He can only see the list of properties that he has created.</li>
    <li>He can only see applications for the properties which he has created.</li>
    <li>He can also create a new application, but for creating a new application he should have the applicant id to whom he is creating an application.</li>
    <li>He can update the status of an application to Checkin, Rejected</li>
    <li>If an applicant is Checked in, he can checkout that applicant. Then the property will no longer occupied by that applicant.</li>
</ul>
<b>2. Applicant View Testing:</b>
<ul>
    <li>Create a new applicant before login.</li>
    <li>Sign up is similar to agent signup, but user_type needs to be selected as Applicant.</li>
    <li>Once the applicant sign up is done, login using the applicant credentials.</li>
    <li>He can click on the view properties to see the list of properties which are un-occupied.</li>
    <li>He can also see the property in which he is staying if he has already checked into one of the properties.</li>   
    <li>At the bottom of properties view there is an option to "Apply Now". He can click on that button to apply to one of the unoccupied properties.</li>
    <li>While applying to a property, the applicant has to give the property id to which he needs to apply.</li>
    <li>Also applicant can view the list of properties that he has applied using View Application button.</li>
    <li>After he applies to a property if he wishes to withdraw the application he can do so on the applications view page.</li>
    <li>If he is already checked into a property, he can checkout of the property from the applications page. The property can then be to allocated to other applicants.</li>
</ul>
<b>3. Admin View Testing:</b>
<ul>
    <li>Admin signup is pre-configured. There can only be one admin and cannot create a new admin using sign up.</li>
    <li>Admin can add/edit/delete users, properties.</li>
    <li>He can view the list of users, applications and properties.</li>
    <li>Admin will have the access to all the agent and applicant functionalities</li>
    <li>He can update any information that he wants to, except changing the email address of users.</li>
    <li>Admin will not have an option to delete his account.</li>
</ul>
<b>4. Edge case scenarios:</b>
<ul>
<li>When a user tries to sign up as admin, the system will throw an error.</li>
<li>Admin can update user details, but cannot update their email address.</li>
<li>Leasing agent can only view the properties that he has created. He cannot see the properties that are created by some other agents/admin.</li>
<li>Leasing agent can only see applications to the properties which are created by him.</li>
<li>If leasing agent tries to check in an applicant to a property that is already occupied then the system throws an error.</li>
<li>Leasing agent cannot withdraw the application. Only applicant can do that.</li>
<li>Leasing agent cannot reject application after checkin. He can only checkout the applicant.</li>
<li>When agent check out an applicant, the property will be available for check in.</li>
<li>After check out, reject, withdraw agent or admin cannot update the application any more.</li>
<li>New application cannot be created for Admins or Agents.</li>
<li>Applicant can't edit property details. He can only view them.</li>
<li>Applicant can withdraw the application after he applied to a property. Also he can checkout after he moves in.</li>
<li>Applicant can't withdraw the application once he moves in.</li>
<li>Applicant can't destroy the application if the applicant already moved in.</li>
</ul>
