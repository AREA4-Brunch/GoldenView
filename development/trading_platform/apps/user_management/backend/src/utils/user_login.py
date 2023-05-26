from django.contrib.auth import login, authenticate


def login_user(username: str, password: str):
    # TODO: login the user, DB based
    print(f"Login User: {username}, {password}")
    # if request.method == 'POST':
        
    #     # Authenticate the user
    #     user = authenticate(request, username=username, password=password)
        
    #     if user is not None:
    #         # User is authenticated, log them in
    #         login(request, user)
    #         return redirect('home')  # Redirect to the home page or any other desired URL
    #     else:
    #         # Invalid credentials, display an error message
    #         error_message = 'Invalid username or password'
    #         return render(request, 'login.html', {'error_message': error_message})
    # else:
    #     # Display the login form
    #     return render(request, 'login.html')

    return
