# MIS - Laboratory Exercise 2 & 3

## Description

### Lab 2

Implement an application for displaying random jokes using the API from the site "https://official-joke-api.appspot.com/".

1. Similar to the example from the exercises, you need to have an initial screen where cards displaying the joke type are listed (hint: fetch data from "https://official-joke-api.appspot.com/types").
2. The cards should be clickable and navigate to a new screen, where all jokes of that type will be listed. You can fetch data from the following endpoint: "https://official-joke-api.appspot.com/jokes/{type}/ten", where type should be replaced with the type of the joke selected on the main screen.
3. Next, you need to have another screen that displays a random joke of the day. This screen will be accessed via a button located in the AppBar. It is your choice whether the button will be on the top-left or top-right corner. For this functionality, use the endpoint: "https://official-joke-api.appspot.com/random_joke".

The project structure should resemble the structure from the exercises (folders: models, screens, widgets, services). API endpoint access should be performed in the file api_services.dart. The design of the interface is up to you.

### Lab 3

Upgrade the application from the previous lab.

1. Implement a new screen where you will add your favorite jokes, from the list of jokes. For this purpose, add a button to mark a favorite joke on the cards on the home screen.
2. You need to register your project on the Firebase console and follow the guide from the audit exercises to connect Firebase to a Flutter project.
3. Enable notifications (local or push) with Firebase to remind the user to open the application and see the joke of the day (at a time of your choice). Use the documentation: https://firebase.google.com/docs/cloud-messaging/flutter/client.

### Лаб 2

Да се имплементира апликација за прикажување на рандом шеги со користење на АПИ од сајтот "https://official-joke-api.appspot.com/".

1. Како примерот на аудиториските вежби, потребно е да имате еден почетен екран на кој ќе листате картички со типот на шегата (помош: влечете податоци од "https://official-joke-api.appspot.com/types").
2. Картичките треба да се кликаат и да носат на нов екран, каде ќе се излистаат сите шеги од тој тип. Може да влечете податоци од следниов endpoint: " https://official-joke-api.appspot.com/jokes/{type}/ten ", каде наместо type ќе го поставите типот од картичката која била кликната на главниот екран.
3. Следно, потребно е да имате нов екран кој ќе ја прикажува рандом шегата на денот. До екранот ќе се пристапува со копче кое се наоѓа во AppBar. Ваш избор е дали копчето ќе стои горе лево или горе десно. За оваа функционалност, пристапувате до "https://official-joke-аpi.appspot.com/random_joke".

Структурата на проектот треба да изгледа како структурата на проектот од аудиториски вежби (фолдери: models, screens, widgets, services). Пристапувања до API endpoints се извршуваат во документот: api_services.dart. Дизајнот на изгледот е по ваш избор. 

### Лаб 3

Да се надгради апликацијата од претходната лабораториска вежба. 

1. Имплементирајте нов екран во кој ќе ги додавате омилените шеги, од листата на шеги. За таа цел додадете копче за ознака на омилена шега на картичките на почетниот екран. 
2. Потребно е да го регистрирате Вашиот проект на конзолата на Firebase и да го следите водичот од аудиториските вежби за поврзување на Firebase со Flutter проект.
3. Да овозможи нотификации (локални или push) со Firebase за потсетување на корисникот да ја отвори апликацијата и да ја види шегата на денот (во време по ваш избор). Користете ја документацијата: https://firebase.google.com/docs/cloud-messaging/flutter/client.
