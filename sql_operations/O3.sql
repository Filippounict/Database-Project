SELECT Film.titolo, Evento.dataEvento, Evento.oraEvento
FROM Film
JOIN Evento ON Film.CodiceFilm = Evento.CodiceFilm
WHERE Evento.dataEvento = '2022-11-12' AND Evento.NumeroSala = 500;
