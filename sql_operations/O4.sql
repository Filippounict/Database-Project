SELECT (s.capienza - COUNT(p.identificativoPosto)) AS posti_disponibili
FROM sala s
INNER JOIN evento e ON s.NumeroSala = e.NumeroSala
LEFT JOIN posto p ON s.NumeroSala = p.NumeroSala
    AND p.IdPrenotazione IN (
        SELECT IdPrenotazione FROM prenotazione WHERE IdEvento = e.IdEvento AND statoPrenotazione <> 'annullata'
    )
WHERE e.IdEvento = 'E1' 

