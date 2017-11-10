# ASKED

1. question (제목, 내용)

   - controller : question

   - action : index, show

     - index.erb : form을 통해 질문을 받는다(익명, 내 이름을 쓸수도).
     - show : 입력된 질문을 보여준다.

   - model :

     - name(질문자 이름)

     - content(내용)

       1. rails g model (모델명)

       2. migration 파일 자성

       3. rake db:migrate

          ** rake db:drop 지워짐

2. user(회원 - eamil, name, password)

   - controller : user

   - Login : user 인증

     - 해당하는 email을 가진 use가 있다면

       ```ruby
       if user
         if user.password == @password
           # session[:user_id] = user.id 
           # id, email둘다 상관없이 가능.
           session[:user_email] = user.email
           reqdirect_to '/'
       end
       ```

3. Sign Up Logic

   - Database에 유저 정보를 저장하는 것.

   1. User table 생성 : User model

   2. User 정보를 저장 : 회원정보를 받아, DB에 저장.

      ​

4. Login Logic

   - Session에 유저정보를 검증을 거친 후 저장하는 것.

     1. User 정보를 받는다.

     2. 받은 User 정보와 DB의 User 정보가 일치하는지 확인

     3. if 일치, session에 유저 정보를 넣는다.

        else, 이유를 말해주고 로그인 안시킨다.

        session[:id(=user_key)]

     - User Login / User LogOut

     - 만약에 User가 로그인을 하지않았을 경우에는 로그인 또는 회원가입

     - 만약 User가 로그인이 되어있으면 로그아웃

       ```ruby
       #views >> layouts >> application.html.erb파일에서
       <% if session[:user_email].nil? %>
         <a href="/question/login">Login</a>
         <a href="/question/sign_up">Sign_Up</a>
       <% else %>
         <a href="/question/logout">LogOut</a>
         <p></p><%= session[:user_email] %>님 환영합니다.</p>
       <% end %>
       ```