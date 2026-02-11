import streamlit as st

st.markdown("<h1 style = 'text-align : center ; '> User Registration </h1>",unsafe_allow_html=True)

#way 1
# form = st.form('Form 1')
# form.text_input("First Name")
# form.form_submit_button("Button")

#way 2

with st.form('Form 2'):

    col1 ,col2= st.columns(2)

    f = col1.text_input("First Name")
    l = col2.text_input("Last Name")
    email = st.text_input("Email Address")
    password = st.text_input("Password")
    confirmed_password = st.text_input("Confirm Password")
    date , month , year = st.columns(3)
    date = date.text_input("Enter Date")
    month = month.text_input("Enter Month")
    year = year.text_input("Enter Year")
    state = st.form_submit_button("Submit")

    if state:
        if (email == "") | (password == "") | (f == "") | (l == "") | (password == "") | (confirmed_password == "") :
            st.warning("Please fill all fields")
        elif password != confirmed_password:
            st.error("Password doesnot match")
        else:
            st.success("Submitted succesfully !")

