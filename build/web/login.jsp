

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eos Admin</title>
        <style>
            /**
  * * General variables
  * */
            /**
             * * General configs
             * */
            * {
                box-sizing: border-box;
            }

            body {
                font-family: "Montserrat", sans-serif;
                font-size: 12px;
                line-height: 1em;
            }

            button {
                background-color: transparent;
                padding: 0;
                border: 0;
                outline: 0;
                cursor: pointer;
            }

            input {
                background-color: transparent;
                padding: 0;
                border: 0;
                outline: 0;
            }
            input[type=submit] {
                cursor: pointer;
            }
            input::-moz-placeholder {
                font-size: 0.85rem;
                font-family: "Montserrat", sans-serif;
                font-weight: 300;
                letter-spacing: 0.1rem;
                color: #ccc;
            }
            input:-ms-input-placeholder {
                font-size: 0.85rem;
                font-family: "Montserrat", sans-serif;
                font-weight: 300;
                letter-spacing: 0.1rem;
                color: #ccc;
            }
            input::placeholder {
                font-size: 0.85rem;
                font-family: "Montserrat", sans-serif;
                font-weight: 300;
                letter-spacing: 0.1rem;
                color: #ccc;
            }

            /**
             * * Bounce to the left side
             * */
            @-webkit-keyframes bounceLeft {
                0% {
                    transform: translate3d(100%, -50%, 0);
                }
                50% {
                    transform: translate3d(-30px, -50%, 0);
                }
                100% {
                    transform: translate3d(0, -50%, 0);
                }
            }
            @keyframes bounceLeft {
                0% {
                    transform: translate3d(100%, -50%, 0);
                }
                50% {
                    transform: translate3d(-30px, -50%, 0);
                }
                100% {
                    transform: translate3d(0, -50%, 0);
                }
            }
            /**
             * * Bounce to the left side
             * */
            @-webkit-keyframes bounceRight {
                0% {
                    transform: translate3d(0, -50%, 0);
                }
                50% {
                    transform: translate3d(calc(100% + 30px), -50%, 0);
                }
                100% {
                    transform: translate3d(100%, -50%, 0);
                }
            }
            @keyframes bounceRight {
                0% {
                    transform: translate3d(0, -50%, 0);
                }
                50% {
                    transform: translate3d(calc(100% + 30px), -50%, 0);
                }
                100% {
                    transform: translate3d(100%, -50%, 0);
                }
            }
            /**
             * * Show Sign Up form
             * */
            @-webkit-keyframes showSignUp {
                100% {
                    opacity: 1;
                    visibility: visible;
                    transform: translate3d(0, 0, 0);
                }
            }
            @keyframes showSignUp {
                100% {
                    opacity: 1;
                    visibility: visible;
                    transform: translate3d(0, 0, 0);
                }
            }
            /**
             * * Page background
             * */

            .user {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 100%;
                height: 100vh;
                background: #ccc;
                background-size: cover;
            }
            .user_options-container {
                position: relative;
                width: 80%;
            }
            .user_options-text {
                display: flex;
                justify-content: space-between;
                width: 100%;
                background-color: rgba(34, 34, 34, 0.85);
                border-radius: 3px;
            }

            /**
             * * Registered and Unregistered user box and text
             * */
            .user_options-registered,
            .user_options-unregistered {
                width: 50%;
                padding: 75px 45px;
                color: #fff;
                font-weight: 300;
            }

            .user_registered-title,
            .user_unregistered-title {
                margin-bottom: 15px;
                font-size: 1.66rem;
                line-height: 1em;
            }

            .user_unregistered-text,
            .user_registered-text {
                font-size: 0.83rem;
                line-height: 1.4em;
            }

            .user_registered-login,
            .user_unregistered-signup {
                margin-top: 30px;
                border: 1px solid #ccc;
                border-radius: 3px;
                padding: 10px 30px;
                color: #fff;
                text-transform: uppercase;
                line-height: 1em;
                letter-spacing: 0.2rem;
                transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
            }
            .user_registered-login:hover,
            .user_unregistered-signup:hover {
                color: rgba(34, 34, 34, 0.85);
                background-color: #ccc;
            }

            /**
             * * Login and signup forms
             * */
            .user_options-forms {
                position: absolute;
                top: 50%;
                left: 30px;
                width: calc(50% - 30px);
                min-height: 420px;
                background-color: #fff;
                border-radius: 3px;
                box-shadow: 2px 0 15px rgba(0, 0, 0, 0.25);
                overflow: hidden;
                transform: translate3d(100%, -50%, 0);
                transition: transform 0.4s ease-in-out;
            }
            .user_options-forms .user_forms-login {
                transition: opacity 0.4s ease-in-out, visibility 0.4s ease-in-out;
            }
            .user_options-forms .forms_title {
                margin-bottom: 45px;
                font-size: 1.5rem;
                font-weight: 500;
                line-height: 1em;
                text-transform: uppercase;
                color: #e8716d;
                letter-spacing: 0.1rem;
            }
            .user_options-forms .forms_field:not(:last-of-type) {
                margin-bottom: 20px;
            }
            .user_options-forms .forms_field-input {
                width: 100%;
                border-bottom: 1px solid #ccc;
                padding: 6px 20px 6px 6px;
                font-family: "Montserrat", sans-serif;
                font-size: 1rem;
                font-weight: 300;
                color: gray;
                letter-spacing: 0.1rem;
                transition: border-color 0.2s ease-in-out;
            }
            .user_options-forms .forms_field-input:focus {
                border-color: gray;
            }
            .user_options-forms .forms_buttons {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 35px;
            }
            .user_options-forms .forms_buttons-forgot {
                font-family: "Montserrat", sans-serif;
                letter-spacing: 0.1rem;
                color: #ccc;
                text-decoration: underline;
                transition: color 0.2s ease-in-out;
            }
            .user_options-forms .forms_buttons-forgot:hover {
                color: #b3b3b3;
            }
            .user_options-forms .forms_buttons-action {
                background-color: #e8716d;
                border-radius: 3px;
                padding: 10px 35px;
                font-size: 1rem;
                font-family: "Montserrat", sans-serif;
                font-weight: 300;
                color: #fff;
                text-transform: uppercase;
                letter-spacing: 0.1rem;
                transition: background-color 0.2s ease-in-out;
            }
            .user_options-forms .forms_buttons-action:hover {
                background-color: #e14641;
            }
            .user_options-forms .user_forms-signup,
            .user_options-forms .user_forms-login {
                position: absolute;
                top: 70px;
                left: 40px;
                width: calc(100% - 80px);
                opacity: 0;
                visibility: hidden;
                transition: opacity 0.4s ease-in-out, visibility 0.4s ease-in-out, transform 0.5s ease-in-out;
            }
            .user_options-forms .user_forms-signup {
                transform: translate3d(120px, 0, 0);
            }
            .user_options-forms .user_forms-signup .forms_buttons {
                justify-content: flex-end;
            }
            .user_options-forms .user_forms-login {
                transform: translate3d(0, 0, 0);
                opacity: 1;
                visibility: visible;
            }

            /**
             * * Triggers
             * */
            .user_options-forms.bounceLeft {
                -webkit-animation: bounceLeft 1s forwards;
                animation: bounceLeft 1s forwards;
            }
            .user_options-forms.bounceLeft .user_forms-signup {
                -webkit-animation: showSignUp 1s forwards;
                animation: showSignUp 1s forwards;
            }
            .user_options-forms.bounceLeft .user_forms-login {
                opacity: 0;
                visibility: hidden;
                transform: translate3d(-120px, 0, 0);
            }
            .user_options-forms.bounceRight {
                -webkit-animation: bounceRight 1s forwards;
                animation: bounceRight 1s forwards;
            }

            /**
             * * Responsive 990px
             * */
            @media screen and (max-width: 990px) {
                .user_options-forms {
                    min-height: 350px;
                }
                .user_options-forms .forms_buttons {
                    flex-direction: column;
                }
                .user_options-forms .user_forms-login .forms_buttons-action {
                    margin-top: 30px;
                }
                .user_options-forms .user_forms-signup,
                .user_options-forms .user_forms-login {
                    top: 40px;
                }

                .user_options-registered,
                .user_options-unregistered {
                    padding: 50px 45px;
                }

            }
        </style>

    </head>
    <body>
        <form  action="login" method="POST" style="margin:auto">
            <section class="user">
                <div class="user_options-container">

                    <div class="user_options-text">
                        <div class="user_options-unregistered">
                            <h2 class="user_unregistered-title">Bạn chưa có tài khoản?</h2>
                            <p class="user_unregistered-text">Hãy nhấn vào đây để tạo một tài khoản để bạn có thể đăng nhập, yên tâm chúng tôi sẽ không bắt bạn đông ý với điều khoản của chúng tôi.</p>
                            <button class="user_unregistered-signup" id="signup-button">Đăng ký</button>
                        </div>

                        <div class="user_options-registered">
                            <h2 class="user_registered-title">Bạn có tài khoản? </h2>
                            <p class="user_registered-text">Hãy nhấn vào đây để bạn có thể đăng nhập và bạn sẽ có một trải nghiệm tuyệt vời.</p>
                            <button class="user_registered-login" id="login-button">Đăng Nhập</button>
                        </div>
                    </div>

                    <div class="user_options-forms" id="user_options-forms">
                        <div class="user_forms-login">
                            <h2 class="forms_title">Đăng Nhập</h2>
                            <form class="forms_form">
                                <fieldset class="forms_fieldset">
                                    <% if (request.getAttribute("error") != null) { %>
                                    <p style="color: red;"><%= request.getAttribute("error") %></p>
                                    <% } %>
                                    <div class="forms_field">
                                        <input type="email" placeholder="Email" name="email" class="forms_field-input" required autofocus />
                                    </div>
                                    <div class="forms_field">
                                        <input type="password" placeholder="Password" name="password"class="forms_field-input" required />
                                    </div>
                                </fieldset> <div class="d-flex my-3  justify-content-between">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input uf-form-check-input" id="remember" style="margin-top: 0.65rem;"/>Remember Me
                                    </div>
                                </div>
                                <div class="forms_buttons">
                                    <button type="button" class="forms_buttons-forgot">Forgot password?</button>
                                    <input type="submit" value="Đăng Nhập" class="forms_buttons-action">
                                </div>
                            </form>
                        </div>
                        </form> 
                        <form action="signup" method="POST" >
                            <div class="user_forms-signup" style="position: relative; top: 50px;">
                                <h2 style="position: relative; top: -54px; left: -16px; display: flex; flex-direction: row; justify-content: center; align-items: flex-start;"class="forms_title">Đăng Ký</h2>
                                <% if (request.getAttribute("error fail") != null) { %>
                                <p style="color: red;"><%= request.getAttribute("error fail") %></p>
                                <% } %>
                                <form style=" position: absolute;  top: 30px;"class="forms_form">

                                    <fieldset class="forms_fieldset" style="position: relative; top: -76px; left: -4px; display: flex; flex-direction: column;">
                                        <div class="forms_field">
                                            <input type="text" placeholder="Full Name" name="fullname" class="forms_field-input" required oninvalid="this.setCustomValidity('Bạn cần điền đủ thông tin!')" oninput="setCustomValidity('')"/>
                                        </div>
                                        <div class="forms_field">
                                            <input type="password" placeholder="Password" name="password" class="forms_field-input" required oninvalid="this.setCustomValidity('Bạn cần điền đủ thông tin!')" oninput="setCustomValidity('')" />
                                        </div>
                                        <div class="forms_field">
                                            <% if (request.getAttribute("error date") != null) { %>
                                            <p style="color: red;"><%= request.getAttribute("error date") %></p>
                                            <% } %>
                                            <input type="date" placeholder="Date of birth" name="dob" class="forms_field-input" required oninvalid="this.setCustomValidity('Bạn cần điền đủ thông tin!')" oninput="setCustomValidity('')" />
                                        </div>
                                        <div class="forms_field">
                                            <label for="gender">Gender:</label>
                                            <select id="gender" placeholder="Gender" name="gender" required>
                                                <option value="">Select Gender</option>
                                                <option value="male">Male</option>
                                                <option value="female">Female</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>
                                        <div class="forms_field">
                                            <% if (request.getAttribute("error signup") != null) { %>
                                            <p style="color: red;"><%= request.getAttribute("error signup") %></p>
                                            <% } %>
                                            <input type="email" placeholder="Email" name="email" class="forms_field-input" required oninvalid="this.setCustomValidity('Bạn cần điền đủ thông tin!')" oninput="setCustomValidity('')" />
                                        </div>
                                        <div class="forms_field">
                                            <input type="text" placeholder="Your phone number" name="phonenumber" class="forms_field-input" pattern="[0-9]{10}" required oninvalid="this.setCustomValidity('Bạn cần điền đủ thông tin!')" oninput="setCustomValidity('')" />
                                        </div>


                                    </fieldset>
                                    <div >
                                        <input style=" position: relative; top: -61px; left: 166px;" type="submit" name="signup"value="Đăng Ký" class="forms_buttons-action">
                                    </div>
                                </form>
                            </div>
                        </form>
                    </div>
                </div>
            </section>


            <script>
                const signupButton = document.getElementById('signup-button');
                const loginButton = document.getElementById('login-button');
                const userForms = document.getElementById('user_options-forms');

                signupButton.addEventListener('click', () => {
                    userForms.classList.remove('bounceRight');
                    userForms.classList.add('bounceLeft');
                }, false);

                loginButton.addEventListener('click', () => {
                    userForms.classList.remove('bounceLeft');
                    userForms.classList.add('bounceRight');
                }, false);
                const forgotButton = document.querySelector('.forms_buttons-forgot');

                forgotButton.addEventListener('click', () => {
                    window.location.href = "forgotPassword.jsp";
                });
            </script>

            <td colspan='2' align='center'>@Copyright by Your fullname</td>	

    </body>
</html>
