-- Aufgabe 3:

/*
View:
Bietet Ansicht ausgewählter Spalten über eine einfache Abfrage der View, 
wobei diese im Hintergrund hochkomplex sein kann - read-only, nur SELECT gespeichert, nicht die Daten.

Komplexer Select kann über einfache Abfrage bedient werden. Besonders geeignet für Abfragen die sehr oft gemacht werden,
da man sich dann die Schreibarbeit erspart und jede Abfrage sicher gleiche Grundlage hat.

*/


CREATE VIEW IF NOT EXISTS conversations_incoming AS
SELECT c.id, c.first_name, c.last_name, COUNT(mess.id)
FROM contacts c
LEFT JOIN conversations conv ON c.id = conv.contact_id
LEFT JOIN messages_conversations mc ON conv.id = mc.conversation_id
LEFT JOIN messages mess ON mc.message_id = mess.id
LEFT JOIN message_tags ON mess.id = mt.message_id
LEFT JOIN tags t ON mt.tag_id = t.id
WHERE conv.id = ?
AND t.name = 'eingehend';

CREATE VIEW IF NOT EXISTS view_conversations AS
SELECT c.id, c.first_name, c.last_name, COUNT(mess.id), mess.sent_at
FROM contacts c
LEFT JOIN conversations conv ON c.id = conv.contact_id
LEFT JOIN messages_conversations mc ON conv.id = mc.conversation_id
LEFT JOIN messages mess ON mc.message_id = mess.id
WHERE conv.id = ?;

-- VIEW conversations: mir fällt nicht mehr ein wie die CTE gegangen ist, Aber ich hätte in Zeile 24 (SELECT)
-- dann noch eingebaut die unterscheidung von letzte eingegangene und letzte ausgegangene Nachricht.
-- die würden unter Zeile 29 mit den jeweiligen Tags herausgesucht werden.


-- Die Abzweigung über Accounts bin ich nicht gegangen, weil ja alle Messages aller Accounts die zur
-- Konversation gehören gezählt werden sollen.

-- Relation von contacts zu contact_tags zu tags würde ich entfernen, da die tags ja die nachrichten beschreiben
-- und nicht den kontakt
