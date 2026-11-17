/*

View problematisch weil: sobald sich eine der vielen Tabellen die dran hängen geändert wird,
ist die View kaputt, außerdem kann die komplexe Abfrage im Hintergrund von "vorne" nicht eingesehen werden. 

Schwierigkeit: Es kann dazu unbeabsichtigten Fehlern der Abfrageergebnisse kommen, weil man nicht genau weiß
was in der View steckt.

Verarbeitung Mail: Weil alle Teilschritte der Transaction nur zusammengehörend korrekt sind.

Datenbanktransaktion: ist eine zusammengehörige Befehlskette, alles zwischen Begin und End muss
korrekt ausgeführt werden, nur dann ist die Transaktion gültig (zB Geld überweisen: bei mir wird es weniger 
und muss bei dir dafür zugleich mehr werden; keine halben Sachen)


Annahme: es gibt auch von sender_address_id verknüpfunt n:1 zu accounts.id (!)
*/
.bail on


BEGIN TRANSACTION;

-- Der Select sollte anhand Absenderadresse den Kontakt suchen, geht sich nicht mehr aus
/*SELECT c.id
FROM contacts c
JOIN addresses a ON c.id */ 

CASE x WHEN (SUM(conversation_id) WHERE account_id = sender) >= 1 
THEN (INSERT INTO conversation ...)
ELSE (CREATE conversations ...)

-- falls etwas bei eingabe schief geht: rollback;
-- falls Datenlimit überschritten: rollback;


END TRANSACTION;