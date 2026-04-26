# Insurance Analysis

## Syfte

Syftet med denna analys är att undersöka vilka faktorer som påverkar försäkringskostnader och att analysera om en regressionsmodell kan användas för att förstå sambanden mellan olika variabler och kostnader.

------------------------------------------------------------------------

## Metod

Analysen genomfördes i R och bestod av flera steg. Först lästes datat in och undersöktes för att förstå struktur, variabeltyper och förekomst av saknade värden. Därefter genomfördes datastädning där saknade värden hanterades och kategoriska variabler standardiserades.

Efter datastädningen genomfördes en beskrivande analys med hjälp av visualiseringar för att identifiera mönster och samband i datat. Slutligen byggdes en linjär regressionsmodell där försäkringskostnader (charges) användes som beroende variabel.

------------------------------------------------------------------------

## Beskrivande analys

Den inledande analysen visade att:

-   Försäkringskostnaderna är högerskevt fördelade, vilket innebär att de flesta individer har relativt låga kostnader medan ett mindre antal har mycket höga kostnader.
-   Rökare har tydligt högre kostnader än icke-rökare, samt större variation i kostnader.
-   Det finns ett svagt positivt samband mellan BMI och kostnader.
-   Personer med högre risk score (baserat på tidigare olyckor och claims) tenderar att ha högre kostnader.

Dessa resultat indikerar att särskilt rökning, BMI och riskhistorik är viktiga faktorer att undersöka vidare i regressionsanalysen.

------------------------------------------------------------------------

## Regressionsanalys

En linjär regressionsmodell användes för att analysera sambandet mellan försäkringskostnader och variablerna ålder, BMI, rökning och antal barn.

Resultaten visar att:

-   Ålder har ett positivt och statistiskt signifikant samband med kostnader (p \< 0.001), vilket innebär att kostnaderna ökar med stigande ålder.
-   BMI har också ett positivt och signifikant samband (p \< 0.001), vilket tyder på att högre BMI är kopplat till högre kostnader.
-   Rökning har den starkaste effekten i modellen (p \< 0.001). Rökare har i genomsnitt cirka 8000 högre kostnader än icke-rökare.
-   Antal barn är inte statistiskt signifikant (p = 0.258), vilket innebär att denna variabel inte verkar ha någon tydlig påverkan på kostnader.

Modellens förklaringsgrad (R²) är cirka 0.54, vilket innebär att modellen förklarar ungefär 54 % av variationen i försäkringskostnader.

------------------------------------------------------------------------

## Slutsats

Analysen visar att rökning är den faktor som har störst påverkan på försäkringskostnader. Även ålder och BMI har betydelse, medan antal barn inte verkar påverka kostnader i någon större utsträckning.

Resultaten är rimliga då rökning och hälsorelaterade faktorer ofta påverkar individers risknivå och därmed kostnader.

Den regressionsmodell som användes kan förklara en del av variationen i kostnader, men inte allt, vilket tyder på att det finns andra faktorer som också påverkar.

Modellen fångar inte alla faktorer som kan påverka kostnader, exempelvis mer detaljerad hälsodata eller livsstilsfaktorer. En möjlig förbättring hade varit att inkludera fler variabler eller testa mer avancerade modeller för att bättre förklara variationen i kostnader.

------------------------------------------------------------------------

## Begränsningar

Analysen har vissa begränsningar. Modellen antar linjära samband mellan variablerna och kostnader, vilket inte alltid behöver vara fallet. Dessutom saknas potentiellt viktiga variabler som kan påverka kostnader, exempelvis genetiska faktorer eller mer detaljerad livsstilsinformation.

Vidare innebär användningen av en relativt enkel modell att alla variationer i datat inte fångas, vilket påverkar modellens förklaringsgrad.

------------------------------------------------------------------------

## Självreflektion

Jag tycker att jag lyckades bra med att strukturera analysen och genomföra alla steg från datastädning till regressionsanalys. Jag använde både visualiseringar och statistiska metoder för att förstå datat.

Det svåraste momentet var att tolka regressionsresultaten och förstå vilka variabler som var mest betydelsefulla.

Jag anser att denna inlämning motsvarar betyget Godkänd, eftersom jag har genomfört alla delar av uppgiften, byggt en regressionsmodell och tolkat resultaten på ett rimligt sätt.
