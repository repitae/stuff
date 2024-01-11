### статическая cookie:
> так называемая _статическая_ **балансировочная** cookie  
>> балансер сгенерит header в ответ клиенту: "Set-Cookie: SERVER_ID=cookie-s1"  
>> клиент все следующие шлет с header: "Cookie: SERVER_ID=cookie-s1"  
>> ВАЖНО: Если `s1` упадет, балансер перекинет сессию на `s2`, у клиента выпадет контекст сессии, т.е. будет разлогон  

```  
backend servers
  mode http
  cookie SERVER_ID insert indirect nocache httponly secure
  server s1 192.168.10.11:80 check cookie cookie-s1
  server s2 192.168.10.12:80 check cookie cookie-s2
```

### динамическая cookie:
> так называемая _динамическая_ **балансировочная** cookie 
>> балансер генерит header "Set-Cookie: SERVER_ID=some_hash"  
>> клиент все следующие запросы шлет с header "Cookie: SERVER_ID=some_hash"  
>> ВАЖНО: Хеш генерится от server ip, port и secret-cookie-key  
>> Остальное поведение как со статической cookie  
>> Важно: Тут директиву cookie на server добавлять нельзя, отвалится dynamic-cookie-key, так как опция на сервер с большим приоритетом  

```
backend servers
  mode http
  cookie SERVER_ID insert indirect nocache httponly secure dynamic
  dynamic-cookie-key secret-cookie-key
  server s1 192.168.10.11:80 check
  server s2 192.168.10.12:80 check
```

### прикладная cookie:
> так называемая **прикладная** cookie  
> (можно использовать только одну cookie с приклада)  
>> приклад генерит header "Set-Cookie: SESSION_ID=some_one_hash"  
>> клиент все следующие запросы шлет с header "Cookie: SESSION_ID=c1~some_one_hash"  
>> ВАЖНО: cookie переписывается балансером в вид SESSION_ID=c1~some_one_hash  
>> Клиент должен уметь работать с модифицированной cookie, и отправлять ее обратно не меняя,  
>> при ответе клиента, балансер удаляет свою модификацию (c1~)  
> и отправляет оригинальтую куку серверу "Cookie: some_one_hash"  

```
backend servers
  mode http
  cookie SESSION_ID prefix nocache httponly secure
  server s1 192.168.10.11:80 check c1
  server s2 192.168.10.12:80 check c2
```

### прилипание по source, без cookie:
> просто потому что метод балансировки по source ip  
>> (т.н. source affinity), или **прилипание по source**    

```
backend servers
  balance source
  hash-type consistent
  server s1 192.168.10.11:80 check
  server s2 192.168.10.12:80 check
```

### некоторые опции:
```
nocache - обязательно, иначе кука ляжет в кеш (не будет сессионной) и если закрыть\открыть браузер, то новый запрос пойдет со старой кукой (из кэша)
prefix - брать куку от приклада (можно только одну использовать), несовместимо с insert indirect
insert - соответственно добавит куку (и если есть еще какие-то прикладные, то они тоже будут в headerе)
rewrite - переписать серверную куку, редко используется, не совместимо с insert (балансерной кукой) или prefix (серверной кукой)
indirect - если запрос пришел с нужной кукой (именем), не трогать ее (по этому не совместимо с rewrite или prefix)
nocache - не класть куку в кеш браузера (приложения), т.е. только на открытой вкладке работает и до тех пор пока сессия не протухла
httponly и secure - секурные атрибуты куки (RFC6265), не использовать куки если не http протокол (приложения) и\или если не защищенное соединение (tls)
domain - кука на домен, редко нужно, вешается не на запрос\сервер, а на fqdn
maxidle - вместе с кукой указывается таймаут использования куки (например 60s), если от клиента не было запросов за прошедшую минуту, если "старая" куки игнорится
maxlife - вместе с кукой указывается относительно время жизни куки (например 24h), как только время прошло - кука игнорится
```