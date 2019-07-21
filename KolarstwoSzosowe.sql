SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `kolarstwo`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `druzyna`
--

CREATE TABLE `druzyna` (
  `IdDruzyny` int(6) NOT NULL,
  `Nazwa` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Kraj` text COLLATE utf8_unicode_ci NOT NULL,
  `Kierownik` text COLLATE utf8_unicode_ci NOT NULL,
  `Budzet` int(6) NOT NULL,
  `DataZalozenia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `druzyna`
--

INSERT INTO `druzyna` (`IdDruzyny`, `Nazwa`, `Kraj`, `Kierownik`, `Budzet`, `DataZalozenia`) VALUES
(1, 'Polaki', 'Polska', 'Lempart', 123, '2019-06-16'),
(2, 'KarolJestBrzydki', 'Afganistan', 'Karol', 2137, '2019-06-17');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `etap`
--

CREATE TABLE `etap` (
  `IdEtapu` int(6) NOT NULL,
  `NrEtapu` int(6) NOT NULL,
  `IdTrasy` int(6) NOT NULL,
  `IdZawodow` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `etap`
--

INSERT INTO `etap` (`IdEtapu`, `NrEtapu`, `IdTrasy`, `IdZawodow`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasyfikacja_generalna`
--

CREATE TABLE `klasyfikacja_generalna` (
  `Pozycja` int(6) NOT NULL,
  `LiczbaPkt` int(6) NOT NULL,
  `Strata` int(6) NOT NULL,
  `IdZawodnika` int(6) NOT NULL,
  `IdZawodow` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `klasyfikacja_generalna`
--

INSERT INTO `klasyfikacja_generalna` (`Pozycja`, `LiczbaPkt`, `Strata`, `IdZawodnika`, `IdZawodow`) VALUES
(1, 300, 20, 1, 1),
(2, 200, 220, 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ranking_swiatowy`
--

CREATE TABLE `ranking_swiatowy` (
  `IdZawodnika` int(6) NOT NULL,
  `Druzyna` int(6) NOT NULL,
  `Punkty` int(6) NOT NULL,
  `Strata` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `ranking_swiatowy`
--

INSERT INTO `ranking_swiatowy` (`IdZawodnika`, `Druzyna`, `Punkty`, `Strata`) VALUES
(1, 0, 300, 20),
(2, 0, 200, 220);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rower`
--

CREATE TABLE `rower` (
  `NumerSeryjny` int(6) NOT NULL,
  `Marka` text COLLATE utf8_unicode_ci NOT NULL,
  `Model` text COLLATE utf8_unicode_ci NOT NULL,
  `TypOpon` int(20) NOT NULL,
  `RozmiarRamy` int(6) NOT NULL,
  `IdZawodnika` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `rower`
--

INSERT INTO `rower` (`NumerSeryjny`, `Marka`, `Model`, `TypOpon`, `RozmiarRamy`, `IdZawodnika`) VALUES
(201020, 'Porsze', 'ROP', 0, 20, 2),
(202020, 'Micubiszi', 'PRO', 0, 30, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sponsor`
--

CREATE TABLE `sponsor` (
  `IdFirmy` int(6) NOT NULL,
  `Nazwa` text COLLATE utf8_unicode_ci NOT NULL,
  `Budzet` int(6) NOT NULL,
  `KontraktOd` date NOT NULL,
  `KontraktDo` date NOT NULL,
  `IdDruzyny` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `sponsor`
--

INSERT INTO `sponsor` (`IdFirmy`, `Nazwa`, `Budzet`, `KontraktOd`, `KontraktDo`, `IdDruzyny`) VALUES
(1, 'Karolex', 1000, '2019-06-17', '0000-00-00', 1),
(2, 'Korzeniex', 2000, '2019-06-17', '0000-00-00', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trasa`
--

CREATE TABLE `trasa` (
  `IdTrasy` int(6) NOT NULL,
  `Dlugosc` int(6) NOT NULL,
  `ZmianaWys` int(6) NOT NULL,
  `Nawierzchnia` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `trasa`
--

INSERT INTO `trasa` (`IdTrasy`, `Dlugosc`, `ZmianaWys`, `Nawierzchnia`) VALUES
(1, 100, 30, 'Slisko'),
(2, 450, 60, 'Sucha');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trener`
--

CREATE TABLE `trener` (
  `IdTrenera` int(6) NOT NULL,
  `Imie` text COLLATE utf8_unicode_ci NOT NULL,
  `Nazwisko` text COLLATE utf8_unicode_ci NOT NULL,
  `Wiek` int(3) NOT NULL,
  `Kraj` text COLLATE utf8_unicode_ci NOT NULL,
  `IdDruzyny` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `trener`
--

INSERT INTO `trener` (`IdTrenera`, `Imie`, `Nazwisko`, `Wiek`, `Kraj`, `IdDruzyny`) VALUES
(1, 'Jan', 'Nowak', 18, 'Polska', 1),
(2, 'Pan', 'Kowak', 81, 'Polska', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyniki_etapu`
--

CREATE TABLE `wyniki_etapu` (
  `Czas` int(6) NOT NULL,
  `Pozycja` int(6) NOT NULL,
  `PktZaEtap` int(6) NOT NULL,
  `Strata` int(6) NOT NULL,
  `IdEtapu` int(6) NOT NULL,
  `IdZawodnika` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `wyniki_etapu`
--

INSERT INTO `wyniki_etapu` (`Czas`, `Pozycja`, `PktZaEtap`, `Strata`, `IdEtapu`, `IdZawodnika`) VALUES
(230, 1, 150, 10, 1, 1),
(210, 1, 150, 10, 2, 1),
(300, 2, 100, 110, 1, 2),
(310, 2, 100, 110, 2, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zawodnik`
--

CREATE TABLE `zawodnik` (
  `IdZawodnika` int(6) NOT NULL,
  `Imie` text COLLATE utf8_unicode_ci NOT NULL,
  `Nazwisko` text COLLATE utf8_unicode_ci NOT NULL,
  `Wiek` int(3) NOT NULL,
  `Kraj` text COLLATE utf8_unicode_ci NOT NULL,
  `Waga` int(3) NOT NULL,
  `GrupaKrwi` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `IdTrenera` int(6) NOT NULL,
  `IdDruzyny` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `zawodnik`
--

INSERT INTO `zawodnik` (`IdZawodnika`, `Imie`, `Nazwisko`, `Wiek`, `Kraj`, `Waga`, `GrupaKrwi`, `IdTrenera`, `IdDruzyny`) VALUES
(1, 'Karol', 'Korzen', 18, 'Afganistan', 90, 'ABrh+', 1, 1),
(2, 'Garol', 'Gorzen', 8, 'Polzga', 81, 'ABrh-', 2, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zawody`
--

CREATE TABLE `zawody` (
  `IdZawodow` int(6) NOT NULL,
  `Nazwa` text COLLATE utf8_unicode_ci NOT NULL,
  `DataRoz` date NOT NULL,
  `DataZak` date NOT NULL,
  `Kraj` text COLLATE utf8_unicode_ci NOT NULL,
  `Nagroda` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `zawody`
--

INSERT INTO `zawody` (`IdZawodow`, `Nazwa`, `DataRoz`, `DataZak`, `Kraj`, `Nagroda`) VALUES
(1, 'Wyscigi', '2019-06-17', '2019-06-22', 'Francja', 20),
(2, 'WcaleNieWyscigi', '2021-06-17', '2021-08-03', 'Niemcy', 32);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `druzyna`
--
ALTER TABLE `druzyna`
  ADD PRIMARY KEY (`IdDruzyny`);

--
-- Indeksy dla tabeli `etap`
--
ALTER TABLE `etap`
  ADD PRIMARY KEY (`IdEtapu`),
  ADD KEY `IdTrasy` (`IdTrasy`),
  ADD KEY `IdZawodow` (`IdZawodow`);

--
-- Indeksy dla tabeli `klasyfikacja_generalna`
--
ALTER TABLE `klasyfikacja_generalna`
  ADD PRIMARY KEY (`IdZawodnika`,`IdZawodow`),
  ADD KEY `IdZawodnika` (`IdZawodnika`),
  ADD KEY `IdZawodow` (`IdZawodow`);

--
-- Indeksy dla tabeli `ranking_swiatowy`
--
ALTER TABLE `ranking_swiatowy`
  ADD PRIMARY KEY (`IdZawodnika`),
  ADD KEY `IdZawodnika` (`IdZawodnika`);

--
-- Indeksy dla tabeli `rower`
--
ALTER TABLE `rower`
  ADD PRIMARY KEY (`NumerSeryjny`),
  ADD KEY `IDZawodnika` (`IdZawodnika`);

--
-- Indeksy dla tabeli `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`IdFirmy`),
  ADD KEY `IdDruzyny` (`IdDruzyny`);

--
-- Indeksy dla tabeli `trasa`
--
ALTER TABLE `trasa`
  ADD PRIMARY KEY (`IdTrasy`);

--
-- Indeksy dla tabeli `trener`
--
ALTER TABLE `trener`
  ADD PRIMARY KEY (`IdTrenera`),
  ADD KEY `IdDruzyny` (`IdDruzyny`);

--
-- Indeksy dla tabeli `wyniki_etapu`
--
ALTER TABLE `wyniki_etapu`
  ADD PRIMARY KEY (`IdZawodnika`,`IdEtapu`),
  ADD KEY `IdEtapu` (`IdEtapu`),
  ADD KEY `IdZawodnika` (`IdZawodnika`);

--
-- Indeksy dla tabeli `zawodnik`
--
ALTER TABLE `zawodnik`
  ADD PRIMARY KEY (`IdZawodnika`),
  ADD KEY `IdTrenera` (`IdTrenera`),
  ADD KEY `IdDruzyny` (`IdDruzyny`);

--
-- Indeksy dla tabeli `zawody`
--
ALTER TABLE `zawody`
  ADD PRIMARY KEY (`IdZawodow`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `etap`
--
ALTER TABLE `etap`
  ADD CONSTRAINT `fk_etap_IdTrasy` FOREIGN KEY (`IdTrasy`) REFERENCES `trasa` (`IdTrasy`),
  ADD CONSTRAINT `fk_etap_IdZawodow` FOREIGN KEY (`IdZawodow`) REFERENCES `zawody` (`IdZawodow`);

--
-- Ograniczenia dla tabeli `klasyfikacja_generalna`
--
ALTER TABLE `klasyfikacja_generalna`
  ADD CONSTRAINT `FK_klasyfikacja_generalna_IdZawodow` FOREIGN KEY (`IdZawodow`) REFERENCES `zawody` (`IdZawodow`),
  ADD CONSTRAINT `fk_klasyfikacja_generalna_IdZawodnika` FOREIGN KEY (`IdZawodnika`) REFERENCES `zawodnik` (`IdZawodnika`);

--
-- Ograniczenia dla tabeli `ranking_swiatowy`
--
ALTER TABLE `ranking_swiatowy`
  ADD CONSTRAINT `fk_ranking_swiatowy_IdZawodnika` FOREIGN KEY (`IdZawodnika`) REFERENCES `zawodnik` (`IdZawodnika`);

--
-- Ograniczenia dla tabeli `rower`
--
ALTER TABLE `rower`
  ADD CONSTRAINT `fk_rower_IdZawodnika` FOREIGN KEY (`IdZawodnika`) REFERENCES `zawodnik` (`IdZawodnika`),
  ADD CONSTRAINT `fk_rower_zawodnik` FOREIGN KEY (`IdZawodnika`) REFERENCES `zawodnik` (`IdZawodnika`);

--
-- Ograniczenia dla tabeli `sponsor`
--
ALTER TABLE `sponsor`
  ADD CONSTRAINT `fk_sponsor_IdDruzyny` FOREIGN KEY (`IdDruzyny`) REFERENCES `druzyna` (`IdDruzyny`);

--
-- Ograniczenia dla tabeli `trener`
--
ALTER TABLE `trener`
  ADD CONSTRAINT `fk_trener_IdDruzyny` FOREIGN KEY (`IdDruzyny`) REFERENCES `druzyna` (`IdDruzyny`);

--
-- Ograniczenia dla tabeli `wyniki_etapu`
--
ALTER TABLE `wyniki_etapu`
  ADD CONSTRAINT `FK_wyniki_etapu_IdEtapu` FOREIGN KEY (`IdEtapu`) REFERENCES `etap` (`IdEtapu`),
  ADD CONSTRAINT `FK_wyniki_etapu_IdZawodnika` FOREIGN KEY (`IdZawodnika`) REFERENCES `zawodnik` (`IdZawodnika`);

--
-- Ograniczenia dla tabeli `zawodnik`
--
ALTER TABLE `zawodnik`
  ADD CONSTRAINT `fk_Zawodnik_IdDruzyny` FOREIGN KEY (`IdDruzyny`) REFERENCES `druzyna` (`IdDruzyny`),
  ADD CONSTRAINT `fk_zawodnik_IdTrenera` FOREIGN KEY (`IdTrenera`) REFERENCES `trener` (`IdTrenera`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
