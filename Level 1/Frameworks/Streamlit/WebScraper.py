import streamlit as st
import requests
from bs4 import BeautifulSoup as bs



st.markdown("  <h1 style = 'text-align : center ;'> Web Scraper </h1>",unsafe_allow_html=True)

with st.form("Search"):
   keyword =  st.text_input("Enter the input")
   search = st.form_submit_button("Search")
placeholder = st.empty()

if search:
   page = requests.get(f"https://unsplash.com/s/photos/{keyword}")
   print(page.status_code)
   soup = bs(page.content , "lxml")
   rows = soup.find_all('div' , class_ = "column-RjrXon")
   col1  , col2 = placeholder.columns(2)
   # print(type(rows))
   
   for row in rows:
      figure = row.find_all("figure")
      # print(type(figure))

      for i in range(len(figure)):
         img = figure[i].find("img",class_ = "responsiveImg-czQTaZ")
         list = img['srcset'].split("?")

         if i == 0:
            col1.image(list[0])
         else:
            col2.image(list[0])
            


   




