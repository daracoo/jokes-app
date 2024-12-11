# MIS - Laboratory Exercise 2

## Description

Да се имплементира апликација за прикажување на рандом шеги со користење на АПИ од сајтот "https://official-joke-api.appspot.com/".

1. Како примерот на аудиториските вежби, потребно е да имате еден почетен екран на кој ќе листате картички со типот на шегата (помош: влечете податоци од "https://official-joke-api.appspot.com/types").
2. Картичките треба да се кликаат и да носат на нов екран, каде ќе се излистаат сите шеги од тој тип. Може да влечете податоци од следниов endpoint: " https://official-joke-api.appspot.com/jokes/{type}/ten ", каде наместо type ќе го поставите типот од картичката која била кликната на главниот екран.
3. Следно, потребно е да имате нов екран кој ќе ја прикажува рандом шегата на денот. До екранот ќе се пристапува со копче кое се наоѓа во AppBar. Ваш избор е дали копчето ќе стои горе лево или горе десно. За оваа функционалност, пристапувате до "https://official-joke-аpi.appspot.com/random_joke".

Структурата на проектот треба да изгледа како структурата на проектот од аудиториски вежби (фолдери: models, screens, widgets, services). Пристапувања до API endpoints се извршуваат во документот: api_services.dart. Дизајнот на изгледот е по ваш избор. 