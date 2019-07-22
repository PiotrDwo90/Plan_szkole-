



DECLARE
	@KDPersonID uniqueidentifier
	,@SelectedYear smallint										    -- Aktualny rok
	,@SelectedWeek tinyint											-- Aktualny tydzie� operacyjny
	,@Html nvarchar(max) --= null output
-- [raporty].[usp_Html_PlanSzkolen] '3BACD22B-D0BD-4663-A49B-14B7E377AD7B', 2018,10
-- [raporty].[usp_Html_PlanSzkolen] 'D26184E4-94F4-42F1-8F6F-10AD0C69C546', 2016,36

set @KDPersonID='D26184E4-94F4-42F1-8F6F-10AD0C69C546'
set @SelectedYear=2019
set @SelectedWeek=10

		Declare @NumerTygodniaOperacyjnego int
		Declare @PoczTygodnia datetime
		Declare @KonTygodnia datetime
		Declare @kd nvarchar(max)
		Declare @ImieOsobyGenerujacejRaport nvarchar(50)
		Declare @NazwiskoOsobyGenerujacejRaport nvarchar(50)
		Declare @strona nvarchar(max)
		Declare @style nvarchar(max)
		Declare @funkcje nvarchar(max)

		select @KonTygodnia=KoniecTygodniaOperacyjnego,@PoczTygodnia=PoczatekTygodniaOperacyjnego, @NumerTygodniaOperacyjnego = NumerTygodniaOperacyjnego from oper.TygodnieOperacyjne w
		where rokoperacyjny=@SelectedYear and tydzienoperacyjny = @SelectedWeek

set @html='  
<body bgcolor="#FFC31E" onload="PobieranieWszystkiego()";>  <style>
#strona {
    background-color: #FFC31E;
    margin: 0;
    padding: 0;
    font-size: x-large;
}

#dataszkoleniaguziki {
    background-color: #FFC31E;
    width: 950px;
    height: 600px;
    margin: 0;
    padding: 0;
    float: left;
    position: fixed;
}

#dataszkolenia {
    background-color: #FFC31E;
    width: 950px;
    height: 50px;
    margin: 0;
    padding: 0;
    float: left;
}

#guzikzapiszszkolenie {
    padding-top: 60px;
    width: 300px;
    height: 50px;
}

#dataczas {
    background-color: #FFC31E;
    width: 500px;
    height: 40px;
    float: left;
    position: fixed;
    margin: 0;
    padding: 7;
}

.dataczas1 {
    height: 40px;
    width: 170px;
    font-size: x-large;
}

#szkolenia {
    background-color: #FFC31E;
    width: 430px;
    height: 40px;
    float: right;
    margin: 0;
    padding: 0;
}

.szkolenia1 {
    height: 40;
    width: 430px;
    font-size: x-large;
}

#guzik1 {
    background-color: #FFC31E;
    width: 950px;
    height: 60px;
    overflow: hidden;
    position: relative;
    margin: 0;
    padding: 0;
    font-size: x-large;
}

#guzik2 {
    background-color: #FFC31E;
    width: 950px;
    height: 60px;
    overflow: hidden;
    position: relative;
    margin: 0;
    padding: 0;
    font-size: x-large;
}

#guzikusunpusteszkolenie {
    float: bottom;
    position: fixed;
}

#guzikzamknijszkolenie {
    float: bottom;
	position: fixed;
}

#guzikdodajdoszkolenia{
    float: bottom;
	position: fixed;
	margin-left: 300px;
}

#doradcy {
    width: 300px;
    height: 600px;
    float: right;
    margin: 0;
    padding: 0;
    overflow: scroll;
}

#doradcyy {
    width: 270px;
    height: 600px;
    float: right;
    margin: 0;
    padding: 0;
    overflow-y: hidden;
}

.doradcy1 {
    width: 270px;
    float: right;
    font-size: x-large;
}

.doradcy_zapis_szkol {
    background-color: green
}

#Tabela_tytyl {
    background-color: #FFC31E;
    width: 950px;
    height: 30px;
    overflow: hidden;
    position: relative;
    margin: 0;
    padding: 0;
    font-size: x-large;
    border: 1px solid black;
}

#hist_szkolenia {
    background-color: #FFC31E;
    width: 950px;
    height: 50px;
    overflow: hidden;
    position: relative;
    font-size: x-large;
    border: 1px solid black;
}

#table_zakladki {
    background: #996600;
    width: 950px;
    height: 10px;
    align: center;
    border: 1px solid black;
}

#td_zakladki {
    background: #996600;
    width: 275x;
    align: center;
    text-align: center;
}

#t1 {
    background: #ff9900;
    align: center;
    border: 1px solid black;
    width: 950px;
    height: 386px;
    overflow-y: auto;
    cellpadding: 0px;
    font-size: x-large;
}

#t1_0 {
    background: #ff9900;
    align: center;
    width: 950px;
    height: 30px;
    border: 1px solid black;
    table-layout: fixed;
    cellpadding: 0px;
    font-size: large;
}

#t2 {
    background: #ff9900;
    align: center;
    border: 1px solid black;
    width: 950px;
    height: 386px;
    overflow-y: auto;
    cellpadding: 0px;
    font-size: x-large;
}

#t2_0 {
    background: #ff9900;
    border: 1px solid black;
    align: center;
    width: 950px;
    height: 30px;
    table-layout: fixed;
    cellpadding: 0px;
    font-size: large;
}

#t3 {
    background: #ff9900;
    align: center;
    border: 1px solid black;
    width: 950px;
    height: 386px;
    overflow-y: auto;
    cellpadding: 0px;
    font-size: x-large;
}

#dvv {
    width: 950px;
    height: 400px;
    overflow: auto;
    overflow-x: hidden;
    border: 1px solid black;
    cellpadding: 0px;
}

#dvv2 {
    width: 950px;
    height: 400px;
    overflow: auto;
    overflow-x: hidden;
    border: 1px solid black;
    cellpadding: 0px;
}

#dvv3 {
    width: 950px;
    height: 400px;
    overflow: auto;
    overflow-x: hidden;
    border: 1px solid black;
    cellpadding: 0px;
}

#p_nowy {
    text-color: green;
}

#td11 {
    height: 50px;
}

td {
    border: 1px solid black;
    height: 10px;
}

ul, ul li {
    display: block;
    list-style: none;
    margin: 0;
    padding: 0;

}

ul li {
    float: left;
}

ul a:link, ul a:visited {
    text-decoration: none;
    display: block;
    width: 270px;
    text-align: center;
    background-color: #996600;
    color: #000;
    border: 2px outset #ccc;
    padding: 5px;
    font-size: x-large;
}

ul a:hover {
    border-style: inset;
    padding: 7px 3px 3px 7px;
}

input[type=checkbox] + label {
    color: #ccc;
    font-style: italic;
}

input[type=checkbox]:checked + label {
    color: #f00;
    font-style: normal;
}

.highlight {
    background-color: #8888FF;
    height: 50px;
}

</style>   

<div>

</div>

<script type="text/javascript">

function pokaz_ukryj(pokaz_naglowek, ukryj_naglowek, pokaz, ukryj1, ukryj2, sterujaca) {
    var z = document.getElementById(ukryj1);
    var x = document.getElementById(ukryj2);
    var y = document.getElementById(''doradcyy'');
    var GuzikZamknij = document.getElementById("guzikzamknijszkolenie");
	var GuzikDodajPoTerminie = document.getElementById("guzikdodajdoszkolenia");
    var GuzikUsun = document.getElementById("guzikusunpusteszkolenie");
    GuzikZamknij.style.display = "none";
	GuzikDodajPoTerminie.style.display="none";
    GuzikUsun.style.display = "none";
    document.getElementById(pokaz_naglowek).style.display = "block";
    document.getElementById(ukryj_naglowek).style.display = "none";
    document.getElementById(pokaz).style.display = "block";
    document.getElementById(ukryj1).style.display = "none";
    document.getElementById(ukryj2).style.display = "none";
    for (var u = 0; u < z.rows.length; u++) {
        z.rows[u].style.backgroundColor = ''#ff9900'';
    }
    for (var t = 0; t < x.rows.length; t++) {
        x.rows[t].style.backgroundColor = ''#ff9900'';
    }
    if (pokaz == ''t1'') {
        document.getElementById(''td_zakladki_1'').style.backgroundColor = ''#8888FF'';
        document.getElementById(''td_zakladki_2'').style.backgroundColor = ''#996600'';
        document.getElementById(''td_zakladki_3'').style.backgroundColor = ''#996600'';
        document.getElementById(''dvv'').style.display = "block";
        document.getElementById(''dvv2'').style.display = "none";
        document.getElementById(''dvv3'').style.display = "none";
    } else if (pokaz == ''t2'') {
        document.getElementById(''td_zakladki_2'').style.backgroundColor = ''#8888FF'';
        document.getElementById(''td_zakladki_1'').style.backgroundColor = ''#996600'';
        document.getElementById(''td_zakladki_3'').style.backgroundColor = ''#996600'';
        document.getElementById(''dvv'').style.display = "none";
        document.getElementById(''dvv2'').style.display = "block";
        document.getElementById(''dvv3'').style.display = "none";
    } else if (pokaz == ''t3'') {
        document.getElementById(''td_zakladki_3'').style.backgroundColor = ''#8888FF'';
        document.getElementById(''td_zakladki_1'').style.backgroundColor = ''#996600'';
        document.getElementById(''td_zakladki_2'').style.backgroundColor = ''#996600'';
        document.getElementById(''dvv'').style.display = "none";
        document.getElementById(''dvv2'').style.display = "none";
        document.getElementById(''dvv3'').style.display = "block";
    }
    if (sterujaca == 1) {
        y.style.display = "none";
        /*chowa list? doradc?w*/
    }
}
		var TablicaDoradcow=[];
		
		TablicaDoradcow[0]=[''47BD48C6-615F-469B-B480-27F5EA2D15A9'',''TEST2'',''Nazwisko_DOR_1'',''Nazwisko_DOR_1'',''Kierownik1''];
		TablicaDoradcow[1]=[''8A632A65-5B07-4C01-979B-A987152E2A37'',''TEST2'',''Nazwisko_DOR_2'',''Nazwisko_DOR_2'',''Kierownik1''];
		TablicaDoradcow[2]=[''8A632A65-5B07-1111-2222-333333333333'',''TEST2'',''Nazwisko_DOR_3'',''Nazwisko_DOR_3'',''Kierownik2''];

	
		'
/*
select	distinct Row_Number() over(order by tmp.KDlastname,tmp.lastname,tmp.firstname,tmp.personid) as num,
		tmp.PersonID,
		tmp.TEST1,
		tmp.FirstName,
		tmp.LastName,
		tmp.KDLastName 
into #v
from 
					(select
							tee.personid as PersonID,
							'NULL' as TEST1,
							tpp.firstname as FirstName,
							tpp.lastname as LastName,
							tsp.lastname as KDLastName
					from 
					tempo.access.udfi_EmployeeRead (@KDPersonid) tee
					join tempo.person.person tpp on tee.personid=tpp.personid
					join tempo.person.person tsp on tee.superiorpersonid=tsp.personid
					where 
						(tee.employeestatusid not in('01933222-3515-40CA-BDF7-623006428A5C','12202EAD-44C8-4C37-8703-3D5141E5A084')	--Nieaktywny i Zwolniony
						and tee.tempopositiontypeid in('723f5316-7c0c-486b-9ba7-318c122a721b','e636e928-400d-4d4d-b15d-d9bdf6431439')--dor i kd
						and tpp.firstname not like '%Wakat%'
						and tpp.firstname not like 'Wirtualny%'
						and tpp.firstname not like 'KDFraud'
						and tpp.firstname not like 'DORfraud'
						and tpp.firstname not like 'DOR PA'
						and tpp.personid <> @KDPersonid)
						--and @KDPersonid <> '3BACD22B-D0BD-4663-A49B-14B7E377AD7B') --wyklucza osobe generujaca raport.
--						or (
--						tee.tempopositiontypeid in('723f5316-7c0c-486b-9ba7-318c122a721b','e636e928-400d-4d4d-b15d-d9bdf6431439')--dor i kd
--						and tpp.firstname not like '%Wakat%'
--						and tpp.firstname not like 'Wirtualny%'
--						and tpp.firstname not like 'KDFraud'
--						and tpp.firstname not like 'DORfraud'
--						and tpp.firstname not like 'DOR PA'
--						and tpp.personid <> @KDPersonid
--						and @KDPersonid='3BACD22B-D0BD-4663-A49B-14B7E377AD7B')
--					union
--				select	distinct ee.personid as PersonID,
--						'NULL' as TEST1,
--						tpp.firstname as FirstName,
--						tpp.lastname as LastName,
--						tsp.lastname as KDLastName
--				from 
--					tempo.employee.employee ee 
--					join tempo.person.person tpp on ee.personid=tpp.personid
--					join tempo.employee.employee tee on tee.personid=tpp.personid
--					join tempo.person.person tsp on tee.superiorpersonid=tsp.personid
--				where 
--				@KDPersonid='3BACD22B-D0BD-4663-A49B-14B7E377AD7B'
--				and ee.superiorpersonid in ('5D5638D1-B082-4C73-A86A-445CC43D7730','334CD2CD-4C3A-4456-9061-D1D5315978A6')
--					union
--				select '5D5638D1-B082-4C73-A86A-445CC43D7730','NULL','Bo�ena','Otecka','Puck'
--				where 
--				@KDPersonid='3BACD22B-D0BD-4663-A49B-14B7E377AD7B'
--					union
--				select '334CD2CD-4C3A-4456-9061-D1D5315978A6','NULL','Marcin','R�czka','Ko�obrzeg'
--				where 
--				@KDPersonid='3BACD22B-D0BD-4663-A49B-14B7E377AD7B'
				) as tmp


				Declare @a nvarchar(10)
					set @a=1;
				Declare @b nvarchar(10)
					set @b=0;
				Declare @DORID nvarchar(max)
				Declare @TEST2 nvarchar(50)
				Declare @DORFirstName nvarchar(50)
				Declare @DORLastName nvarchar(50)
				Declare @KDLastName nvarchar(50)
				Declare @IloscWierszy int
				set @IloscWierszy=(select count(*) from #v)
					while @a <= @iloscwierszy
					begin
						set @DORID = (select PersonID from #v where num=@a);
						set @TEST2 = (select TEST1 from #v where num=@a);
						set @DORFirstName = (select FirstName from #v where num=@a);
						set @DORLastName = (select LastName from #v where num=@a);
						set @KDLastName=(select substring(KDLastName,0,6) from #v where num=@a);
		set @html=@html+'
		TablicaDoradcow['+@b+']=['''+@DORID+''','''+@TEST2+''','''+@DORFirstName+''','''+@DORLastName+''','''+@KDLastName+'''];'
						set @b=@b+1;
						set @a=@a+1;
							
					end;
					*/
		set @html=@html+'var TablicaSzkolen=[];'
/*
					select	Row_Number() over(order by tp_GUID) as num,
							tp_GUID as IDSzkolenia,
							nvarchar1 COLLATE Polish_CI_AS as NazwaSzkolenia
					into #v2
					from WSS_Content.dbo.AllUserData
					where tp_ListId = '67C7AC0B-302D-4DAA-95EA-A863D4537137' --id listy na SHP
					--and getdate() between tempo.dbo.GetLocalFromUTC(datetime1) and tempo.dbo.GetLocalFromUTC(datetime2)
					and tp_deletetransactionid=0x
					and tp_IsCurrentVersion = 1
					and tp_IsCurrent = 1
					
		--drop table #v2
					set @a=1;
					set @b=0;
				Declare @SzkolenieID nvarchar(max)
				Declare @NazwaSzkolenia nvarchar(50)
				set @IloscWierszy=(select count(*) from #v2)
					while @a <= @iloscwierszy
					begin
						set @SzkolenieID = (select IDSzkolenia from #v2 where num=@a);
						set @NazwaSzkolenia = (select NazwaSzkolenia from #v2 where num=@a);
		set @html=@html+'
		TablicaSzkolen['+@b+']=['''+@SzkolenieID+''','''+(@NazwaSzkolenia)+'''];'
						set @b=@b+1;
						set @a=@a+1;
							
					end;
	*/				
set @html=@html+'
TablicaSzkolen[0]=[''0A235B59-C973-4DE3-AFAB-086A37351941'', ''Szkolenie1''];
TablicaSzkolen[1]=[''0A235B59-C973-4DE3-AFAB-123456789111'', ''Szkolenie2''];
'

		--select top 10 * from tempo.employee.trainings
		set @html=@html+'var TablicaZapisanychSzkolen=[];'
/*		select Row_Number()over(order by Date ,case when dor = '11111111-1111-1111-1111-111111111111' then 1 else 2 end,trainingid,dor) as num,* 
				into #v3
				from (
						select  distinct
									ts.Date as date,
									ts.TrainingID as trainingid,
									AUD.nvarchar1 as TrainingName,
									ts.dor,
									isnull(ee.employeestatusid,'B6143FB1-3D44-4C83-8E48-AE3CF4A4FD59') as StatusPracownika,
									isnull(ts.TrainingPresence,'0') as TrainingPresence,
									isnull(ts.TrainingClose,'0') as TrainingClose
							from tempo.employee.Trainings TS
							join WSS_Content.dbo.AllUserData AUD on ts.trainingid=AUD.tp_GUID
							left join tempo.employee.employee ee on ee.personid=ts.dor
							--join tempo.access.udfi_EmployeeRead (@KDPersonid) er on er.personid=ts.dor or ts.dor='11111111-1111-1111-1111-111111111111'
							where ts.CreatePersonid=@kdpersonid
							and ts.isdeleted not like '1'
							and AUD.tp_deletetransactionid=0x
							and AUD.tp_IsCurrentVersion = 1
							and AUD.tp_IsCurrent = 1
							and (ts.dor in (select personid from tempo.access.udfi_EmployeeRead (@kdpersonid)) or ts.dor='11111111-1111-1111-1111-111111111111')
							--and getdate() between tempo.dbo.GetLocalFromUTC(AUD.datetime1) and tempo.dbo.GetLocalFromUTC(AUD.datetime2)
				) as temp
				--where temp.statuspracownika not in('01933222-3515-40CA-BDF7-623006428A5C','12202EAD-44C8-4C37-8703-3D5141E5A084')	--Nieaktywny i Zwolniony


			set @a=1;
			set @b=0;
			Declare @Data nvarchar(10)
			Declare @Time nvarchar(5)
			Declare @IdSzkolenia nvarchar(100)
			Declare @NSzk nvarchar(100)
			Declare @dor nvarchar(100)
			Declare @Presence nvarchar(1)
			Declare @Close nvarchar(1)
			set @IloscWierszy=(select count(*) from #v3)
						while @a <= @iloscwierszy
						begin
							set @Data = (select replace(convert(varchar(10),Date,102),'.','-') from #v3 where num=@a);
							set @Time = (select convert(varchar(5),Date,114) from #v3 where num=@a);
							set @IdSzkolenia = (select TrainingId from #v3 where num=@a);
							set @NSzk= (select TrainingName from #v3 where num=@a);
							set @dor = (select dor from #v3 where num=@a);
							set @Close =(select TrainingClose from #v3 where num=@a);
							set @Presence = (select TrainingPresence from #v3 where num=@a);

			set @html=@html+'
			TablicaZapisanychSzkolen['+@b+']=['''+@Data+''','''+@Time+''','''+@IdSzkolenia+''','''+@Nszk+''','''+@dor+''','''+@Presence+''','''+@Close+'''];'
							set @b=@b+1;
							set @a=@a+1;
			end;
			*/
set @html=@html+'TablicaZapisanychSzkolen[0] = [''2015-10-05'', ''14:00'', ''0A235B59-C973-4DE3-AFAB-086A37351941'', ''Szkolenie1'', ''11111111-1111-1111-1111-111111111111'',''1'',''0''];  
	TablicaZapisanychSzkolen[1] = [''2015-10-05'', ''14:00'', ''0A235B59-C973-4DE3-AFAB-086A37351941'', ''Szkolenie1'', ''47BD48C6-615F-469B-B480-27F5EA2D15A9'',''1'',''0''];  
	TablicaZapisanychSzkolen[2] = [''2015-10-05'', ''14:00'', ''0A235B59-C973-4DE3-AFAB-086A37351941'', ''Szkolenie1'', ''8A632A65-5B07-4C01-979B-A987152E2A37'',''1'',''0''];'


/*
select * from #v
select * from #v2
select * from #v3
*/

set @html=@html+'	
var IleZaznaczonych = 0;
var test = 0;
var AktualnaData = '''+convert(nvarchar(19),getdate(),121)+''';
var PoTerminie = ''NULL'';
function AddDorToSelect(zm0, zm1, zm2, zm3) {
    try {
        var x = document.getElementById("doradcyy");
        var option = document.createElement("option");
        x.style.height = TablicaDoradcow.length * 30 + "px";
        option.value = zm0;
        option.innerHTML = zm1 + " " + zm2 + " <p style=''font-size:10px''>(" + zm3 + ")</p>";
        x.appendChild(option);
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E1: " + err.message;
    }
}
function AddSzkoleniaToSelect(zm0, zm1) {
    try {
        var x = document.getElementById("szkoleniaa");
        var option = document.createElement("option");
        option.value = zm0;
        option.innerHTML = zm1;
        x.appendChild(option);
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E2: " + err.message;
    }
}
function AddDorToSzkolenia(sterujaca, idszkolenia, nazwaszkolenia, data, Time, Doradca, tabela, Czyobecny) {
    try {
        var asd = ''0'';
        var CzySzkolenie = "NULL";
        var CzyZapisany = "NULL";
        var CzyZmienicObecnosc = "0";
        var ktoryzapisanychszkoleniach = "NULL";
        if (sterujaca == ''NOWY'') {
            CzySzkolenie = CzyJestTakieSzkolenie(idszkolenia, data, Time);
            if (CzySzkolenie == ''NULL'') {
                DodNowyWierszSzkolenia(tabela, ''1'', idszkolenia, nazwaszkolenia, data, Time, Doradca, ''0'');
            } else if (CzySzkolenie == ''1'') {
                CzyZapisany = CzyDorZapisanyNaToSzkolenie(idszkolenia, data, Time, Doradca);
                if (CzyZapisany == ''1'') {
                    CzyZmienicObecnosc = CzyObecnoscZmieniona(idszkolenia, data, Time, Doradca, Czyobecny);
                    if (CzyZmienicObecnosc == ''1'') {
                        ktoryzapisanychszkoleniach = KtoryWTabeli(idszkolenia, data, Time, Doradca, Czyobecny);
                        ModyfikacjaWierszaSzkolenia(tabela, asd, CzyZmienicObecnosc, "NULL", idszkolenia, nazwaszkolenia, data, Time, Doradca, Czyobecny, ktoryzapisanychszkoleniach);
                    }
                } else if (CzyZapisany == ''NULL'') {
                    CzyZmienicObecnosc = CzyObecnoscZmieniona(idszkolenia, data, Time, Doradca, Czyobecny);
                    if (CzyZmienicObecnosc == ''1'') {
                        ktoryzapisanychszkoleniach = KtoryWTabeli(idszkolenia, data, Time, Doradca, Czyobecny);
                        ModyfikacjaWierszaSzkolenia(tabela, asd, CzyZmienicObecnosc, "NULL", idszkolenia, nazwaszkolenia, data, Time, Doradca, Czyobecny, ktoryzapisanychszkoleniach);
                    } else {
                        ktoryzapisanychszkoleniach = KtoryWTabeli(idszkolenia, data, Time, Doradca, Czyobecny);
                        ModyfikacjaWierszaSzkolenia(tabela, asd, CzyZmienicObecnosc, "NULL", idszkolenia, nazwaszkolenia, data, Time, Doradca, Czyobecny, ktoryzapisanychszkoleniach);
                    }
                } else {
                    alert("ERROR??");
                }
            } else {
                alert("ERROR" + sterujaca + " " + CzySzkolenie);
            }
        } else if (sterujaca == ''NOWY1'') {
            CzySzkolenie = CzyJestTakieSzkolenie(idszkolenia, data, Time);
            if (CzySzkolenie == ''NULL'') {
                DodNowyWierszSzkolenia(tabela, ''1'', idszkolenia, nazwaszkolenia, data, Time, Doradca, ''0'');
            } else if (CzySzkolenie == ''1'') {
                CzyZapisany = CzyDorZapisanyNaToSzkolenie(idszkolenia, data, Time, Doradca);
                if (CzyZapisany == ''1'') {} else if (CzyZapisany == ''NULL'') {
                    ModyfikacjaWierszaSzkolenia(tabela, asd, CzyZmienicObecnosc, "NULL", idszkolenia, nazwaszkolenia, data, Time, Doradca, Czyobecny);
                } else {
                    alert("ERROR??")
                }
            } else {
                alert("ERROR" + sterujaca + " " + CzySzkolenie + " " + CzyZapisany);
            }
        } else if (sterujaca == ''0'') {
            if (Doradca = ''11111111-1111-1111-1111-111111111111'') {
                PoczDodWierszeSzkolenia(tabela, ''0'', idszkolenia, nazwaszkolenia, data, Time, Doradca, ''0'');
            } else {
                PoczDodWierszeSzkolenia(tabela, ''1'', idszkolenia, nazwaszkolenia, data, Time, Doradca, ''0'');
            }
        } else if (sterujaca == ''PustePoczatek'') {
            PoczDodWierszeSzkolenia(tabela, ''0'', idszkolenia, nazwaszkolenia, data, Time, Doradca, ''0'');
        } else if (sterujaca == ''PoTerminie'') {
            CzyZmienicObecnosc = CzyObecnoscZmieniona(idszkolenia, data, Time, Doradca, Czyobecny);
            if (CzyZmienicObecnosc == ''1'') {
                ktoryzapisanychszkoleniach = KtoryWTabeli(idszkolenia, data, Time, Doradca, Czyobecny, sterujaca);
                /*alert(''tak '' + ktoryzapisanychszkoleniach);*/
                ModyfikacjaWierszaSzkolenia(tabela, asd, CzyZmienicObecnosc, "PoTerminie", idszkolenia, nazwaszkolenia, data, Time, Doradca, Czyobecny, ktoryzapisanychszkoleniach);
            } else {
                ktoryzapisanychszkoleniach = KtoryWTabeli(idszkolenia, data, Time, Doradca, Czyobecny, sterujaca);
                /*alert(''tak '' + ktoryzapisanychszkoleniach);*/
                ModyfikacjaWierszaSzkolenia(tabela, asd, CzyZmienicObecnosc, "PoTerminie", idszkolenia, nazwaszkolenia, data, Time, Doradca, Czyobecny, ktoryzapisanychszkoleniach);
            }
        } else {
            alert("ERROR" + sterujaca + " " + CzySzkolenie + " " + CzyZapisany);
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E3: " + err.message;
    }
}
function PobierzDoradcow(tabela, idszkolenia, data, godzina) {
    try {
        ZrzucTabeleDOR();
        if (tabela == ''t1'') {
            for (i = 0; i < TablicaDoradcow.length; i++) {
                AddDorToSelect(TablicaDoradcow[i][0], TablicaDoradcow[i][2], TablicaDoradcow[i][3], TablicaDoradcow[i][4]);
            }
        } else if (tabela == ''t2'') {
            for (i = 0; i < TablicaZapisanychSzkolen.length; i++) {
                /*Data,godzina,idszkolenia,nazwaszkolenia,dorid,TrainingPresence,TrainingClose*/if (TablicaZapisanychSzkolen[i][2] == idszkolenia && TablicaZapisanychSzkolen[i][0] == data && TablicaZapisanychSzkolen[i][1] == godzina) {
                    if (TablicaZapisanychSzkolen[i][4] !== "11111111-1111-1111-1111-111111111111") {
                        for (j = 0; j < TablicaDoradcow.length; j++) {
                            if (TablicaZapisanychSzkolen[i][4] == TablicaDoradcow[j][0]) {
                                AddDorToSelect(TablicaDoradcow[j][0], TablicaDoradcow[j][2], TablicaDoradcow[j][3], TablicaDoradcow[j][4]);
                                j = TablicaDoradcow.length;
                            }
                        }
                    }
                }
            }
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E4: " + err.message;
    }
}
function PobierzSzkoleniaGora() {
    try {
        for (i = 0; i < TablicaSzkolen.length; i++) {
            AddSzkoleniaToSelect(TablicaSzkolen[i][0], TablicaSzkolen[i][1]);
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E5: " + err.message;
    }
}
function PobierzSzkoleniaDol() {
    /*pobiera szkolenia z TablicaZapisanychSzkolen*/try {
        var TymczasDlugoscTabeliZapisanychSzkolen = TablicaZapisanychSzkolen.length;
        if (!(TablicaZapisanychSzkolen.length == 0)) {
            for (var i = 0; i < TablicaZapisanychSzkolen.length; i++) {
                var modyfikacja = 0;
                var idszk1 = TablicaZapisanychSzkolen[i][2];
                var ns1 = TablicaZapisanychSzkolen[i][3];
                var d1 = TablicaZapisanychSzkolen[i][0];
                var g1 = TablicaZapisanychSzkolen[i][1];
                var dor1 = TablicaZapisanychSzkolen[i][4];
                var co1 = TablicaZapisanychSzkolen[i][5];
                var tabela = "NULL";
                tabela = KtoraTabela(d1, g1, TablicaZapisanychSzkolen[i][6]);
                for (var j = 0; j < i; j++) {
                    var idszk1_wew = TablicaZapisanychSzkolen[j][2];
                    var ns1_wew = TablicaZapisanychSzkolen[j][3];
                    var d1_wew = TablicaZapisanychSzkolen[j][0];
                    var g1_wew = TablicaZapisanychSzkolen[j][1];
                    if (idszk1 == idszk1_wew && ns1 == ns1_wew && d1 == d1_wew && g1 == g1_wew) {
                        modyfikacja = 1;
                        ModyfikacjaWierszaSzkolenia(tabela, ''0'', ''0'', ''POCZ'', idszk1, ns1, d1, g1, dor1, co1, i);
                        j = TablicaZapisanychSzkolen.length;
                    }
                }
                if (modyfikacja == 0) {
                    if (dor1 == '''') {
                        AddDorToSzkolenia(''PustePoczatek'', idszk1, ns1, d1, g1, dor1, tabela, ''0'');
                    } else {
                        AddDorToSzkolenia(''0'', idszk1, ns1, d1, g1, dor1, tabela, ''0'');
                    }
                }
            }
        } else {/*alert("TablicaZapisanychSzkolenJestPusta\nDodaj jakies szkolenie");*/}
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E6: " + err.message;
    }
}
function ZrzucTabeleSzkolenGora() {
    try {
        var x = document.getElementById("szkoleniaa");
        for (i = 0; i < TablicaSzkolen.length; i++) {
            x.remove(1);
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E7.1: " + err.message;
    }
}
function ZrzucTabeleDOR() {
    try {
        var x = document.getElementById("doradcyy");
        for (var i = 0; i < x.length; i) {
            x.remove(0);
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E7.2: " + err.message;
    }
}
function ZrzucTabeleSzkoleniaDol() {
    try {
        var x = document.getElementById("t11");
        var y = document.getElementById("t21");
        var z = document.getElementById("t31");
        if (x)
            x.parentNode.parentNode.parentNode.removeChild(x.parentNode.parentNode);
        if (y)
            y.parentNode.parentNode.parentNode.removeChild(y.parentNode.parentNode);
        if (z)
            z.parentNode.parentNode.parentNode.removeChild(z.parentNode.parentNode);
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E7.3: " + err.message;
    }
}
function PoczDodWierszeSzkolenia(tabela, i, idszkolenia, nazwaszkolenia, data, godzina, dorid, obecni) {
    try {
        var table = document.getElementById(tabela);
        var row = table.insertRow();
        row.style.height = 70 + "px";
        if (tabela == ''t1'') {
            row.innerHTML = "<td id=''" + tabela + "1'' onclick=KlikNaSzkolenie(''" + tabela + "'',''" + idszkolenia + "'',''" + data + "'',''" + godzina + "'')>" + nazwaszkolenia + "</td><td id=''" + tabela + "1'' onclick=KlikNaSzkolenie(''" + tabela + "'',''" + idszkolenia + "'',''" + data + "'',''" + godzina + "'')>" + data + " " + godzina + "</td><td id=''" + tabela + "1'' onclick=KlikNaSzkolenie(''" + tabela + "'',''" + idszkolenia + "'',''" + data + "'',''" + godzina + "'')>" + i + "</td>";
        } else {
            row.innerHTML = "<td id=''" + tabela + "1'' onclick=KlikNaSzkolenie(''" + tabela + "'',''" + idszkolenia + "'',''" + data + "'',''" + godzina + "'')>" + nazwaszkolenia + "</td><td id=''" + tabela + "1'' onclick=KlikNaSzkolenie(''" + tabela + "'',''" + idszkolenia + "'',''" + data + "'',''" + godzina + "'')>" + data + " " + godzina + "</td><td id=''" + tabela + "1'' onclick=KlikNaSzkolenie(''" + tabela + "'',''" + idszkolenia + "'',''" + data + "'',''" + godzina + "'')>" + i + "</td><td>" + obecni + "</td>";
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + " " + err.message;
    }
}
function DodNowyWierszSzkolenia(tabela, nr, idszkolenia, nazwaszkolenia, data, godzina, dorid, obecni) {
    try {
        var table = document.getElementById(tabela);
        var row = table.insertRow();
        row.style.height = 70 + "px";
        if (tabela == ''t1'') {
            row.innerHTML = "<td id=" + tabela + "1 onclick=KlikNaSzkolenie(''" + tabela + "'',''" + idszkolenia + "'',''" + data + "'',''" + godzina + "'')>" + nazwaszkolenia + "</td><td id=''" + tabela + "1'' onclick=KlikNaSzkolenie(''" + idszkolenia + "'',''" + data + "'',''" + godzina + "'')>" + data + " " + godzina + "</td><td id=''" + tabela + "1'' onclick=KlikNaSzkolenie(''" + tabela + "'',''" + idszkolenia + "'',''" + data + "'',''" + godzina + "'')>" + nr + "</td>";
        } else {
            row.innerHTML = "<td id=''" + tabela + "1'' onclick=KlikNaSzkolenie(''" + tabela + "'',''" + idszkolenia + "'',''" + data + "'',''" + godzina + "'')>" + nazwaszkolenia + "</td><td id=''" + tabela + "1'' onclick=KlikNaSzkolenie(''" + tabela + "'',''" + idszkolenia + "'',''" + data + "'',''" + godzina + "'')>" + data + " " + godzina + "</td><td id=''" + tabela + "1'' onclick=KlikNaSzkolenie(''" + tabela + "'',''" + idszkolenia + "'',''" + data + "'',''" + godzina + "'')>" + nr + "</td><td>" + obecni + "</td>";
        }
        var OstatniElementTablicy = TablicaZapisanychSzkolen.length;
        TablicaZapisanychSzkolen[OstatniElementTablicy] = [data, godzina, idszkolenia, nazwaszkolenia, dorid, ''0'', ''0''];
        mobileInterface.sendReportMessage(''DoradcyDoSzkoleniaDodawanie_1:'' + data + ", " + godzina + ", " + idszkolenia + ", " + nazwaszkolenia + ", " + dorid + ", 0, 0");
        /*alert("DoradcyDoSzkoleniaDodawanie:" + data + ", " + godzina + ", " + idszkolenia + ", " + nazwaszkolenia + ", " + dorid+ ", 0, 0");*/Test_Baza_Wpisz();
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E9: " + err.message;
    }
}
function ModyfikacjaWierszaSzkolenia(tabela, CzyKasowac, CzyZmienicObecnosc, id, idszkolenia, nazwaszkolenia, data, godzina, dorid, czyobecny, ktoryidwtabeli) {
    try {
        for (var i = 0; i < TablicaZapisanychSzkolen.length; ) {
            var WpisIDszk = "NULL";
            var datawew = "NULL";
            var godzwew = "NULL";
            var iledorzapisanych = "NULL";
            var idszk = "NULL";
            var ildor = "NULL";
            var listador = document.getElementById("doradcyy");
            var GuzikUsun = document.getElementById("guzikusunpusteszkolenie");
            var ileDORobecni = "NULL";
            WpisIDszk = document.getElementById(tabela).rows[i].innerHTML;
            datawew = document.getElementById(tabela).rows[i].cells[1].innerHTML;
            iledorzapisanych = document.getElementById(tabela).rows[i].cells[2].innerHTML;
            idszk = WpisIDszk.substring(44, 80);
            ildor = iledorzapisanych;
            /*      if(data==''2015-10-20'' && idszkolenia==''D227A7EE-FA6F-48FE-B988-C0A4F359A6CD''){       alert("STOP");      }  */var zmiana = "";
            if (CzyKasowac == ''0'' && id == "NULL" && idszk == idszkolenia && datawew == data + " " + godzina) {
                zmiana = "*+MOD+*";
                /*dodawanie obecno?ci DOR*/if (tabela == ''t2'' || tabela == ''t3'') {
                    /*if(czyobecny==''1'' && czyobecny !== TablicaZapisanychSzkolen[ktoryidwtabeli][5]){ TUTAJ*/if (CzyZmienicObecnosc == ''1'') {
                        /* && (dorid!=="11111111-1111-1111-1111-111111111111"))*/ileDORobecni = document.getElementById(tabela).rows[i].cells[3].innerHTML;
                        ileDORobecni++;
                        document.getElementById(tabela).rows[i].cells[3].innerHTML = ileDORobecni;
                        /*alert(''Przed ''+TablicaZapisanychSzkolen[i]);*/TablicaZapisanychSzkolen[ktoryidwtabeli] = [data, godzina, idszkolenia, nazwaszkolenia, dorid, ''1'', ''0''];
                        mobileInterface.sendReportMessage(''DoradcyDoSzkoleniaDodawanieObecnosci_1:'' + data + ", " + godzina + ", " + idszkolenia + ", " + nazwaszkolenia + ", " + dorid + ", 1, 0");
                        Test_Baza_Wpisz();
                        /*alert(''Po ''+TablicaZapisanychSzkolen[i]);*/i = TablicaZapisanychSzkolen.length;
                    } else if (czyobecny == ''1'' && czyobecny == TablicaZapisanychSzkolen[ktoryidwtabeli][5]) {
                        ileDORobecni = document.getElementById(tabela).rows[i].cells[3].innerHTML;
                        ileDORobecni++;
                        document.getElementById(tabela).rows[i].cells[3].innerHTML = ileDORobecni;
                        i = TablicaZapisanychSzkolen.length;
                    }
                } else {
                    /*dodawanie DOR do planowanego szkolenia*/ildor++;
                    GuzikUsun.style.display = "none";
                    document.getElementById(tabela).rows[i].cells[2].innerHTML = ildor;
                    TablicaZapisanychSzkolen[TablicaZapisanychSzkolen.length] = [data, godzina, idszkolenia, nazwaszkolenia, dorid, ''0'', ''0''];
                    mobileInterface.sendReportMessage(''DoradcyDoSzkoleniaDodawanie_1:'' + data + ", " + godzina + ", " + idszkolenia + ", " + nazwaszkolenia + ", " + dorid + ", 0, 0");
                    /*alert("DoradcyDoSzkoleniaDodawanie:" + data + ", " + godzina + ", " + idszkolenia + ", " + nazwaszkolenia + ", " + dorid+ ", 0, 0");*/Test_Baza_Wpisz();
                    i = TablicaZapisanychSzkolen.length;
                }
            } else if (CzyKasowac == ''0'' && id == "PoTerminie" && idszk == idszkolenia && datawew == data + " " + godzina && tabela == ''t2'') {
                zmiana = "*+MOD PO TERMINIE+*";
                /*alert(zmiana);*/
                TablicaZapisanychSzkolen[TablicaZapisanychSzkolen.length] = [data, godzina, idszkolenia, nazwaszkolenia, dorid, ''1'', ''0''];
				ildor = document.getElementById(tabela).rows[i].cells[2].innerHTML;
                ildor++;
                document.getElementById(tabela).rows[i].cells[2].innerHTML = ildor;
				ileDORobecni = document.getElementById(tabela).rows[i].cells[3].innerHTML;
                ileDORobecni++;
                document.getElementById(tabela).rows[i].cells[3].innerHTML = ileDORobecni;
                mobileInterface.sendReportMessage(''DoradcyDoSzkoleniaPoTermDodawanie_1:'' + data + ", " + godzina + ", " + idszkolenia + ", " + nazwaszkolenia + ", " + dorid + ", 1, 0");
				Test_Baza_Wpisz();
                i = TablicaZapisanychSzkolen.length;
            } else if (CzyKasowac == ''0'' && id == "POCZ" && idszk == idszkolenia && datawew == data + " " + godzina) {
                zmiana = "*+MOD+*";
                if (tabela == ''t2'' || tabela == ''t3'') {
                    if (czyobecny == ''1'') /*&& (dorid!=="11111111-1111-1111-1111-111111111111"))*/{
                        ileDORobecni = document.getElementById(tabela).rows[i].cells[3].innerHTML;
                        ileDORobecni++;
                        document.getElementById(tabela).rows[i].cells[3].innerHTML = ileDORobecni;
                        /*alert(''Przed ''+TablicaZapisanychSzkolen[i]);*//*TablicaZapisanychSzkolen[ktorywtabeli] = [data, godzina, idszkolenia, nazwaszkolenia, dorid,''1'',''0''];*//*alert(''Po ''+TablicaZapisanychSzkolen[i]);*/
                    }
                }
                ildor++;
                document.getElementById(tabela).rows[i].cells[2].innerHTML = ildor;
                i = TablicaZapisanychSzkolen.length;
            } else if (CzyKasowac == ''1'' && idszk == idszkolenia && datawew == data + " " + godzina) {
                zmiana = "*-MOD-*";
                if (tabela == ''t1'') {
                    ildor--;
                    if (ildor == ''0'') {
                        document.getElementById("guzikusunpusteszkolenie").style.display = "block";
                        document.getElementById(tabela).rows[i].cells[2].innerHTML = ildor;
                        TablicaZapisanychSzkolen.splice(id, 1);
                        delete TablicaZapisanychSzkolen[TablicaZapisanychSzkolen.length];
                        mobileInterface.sendReportMessage(''DoradcyDoSzkoleniaWypisywanie_1:'' + data + ", " + godzina + ", " + idszkolenia + ", " + nazwaszkolenia + ", " + dorid + ", 0, 0");
                        /*alert("DoradcyDoSzkoleniaWypisywanie:" + data + ", " + godzina + ", " + idszkolenia + ", " + nazwaszkolenia + ", " + dorid+ ", 0, 0");*/Test_Baza_Wpisz();
                        i = TablicaZapisanychSzkolen.length;
                    } else {
                        document.getElementById(tabela).rows[i].cells[2].innerHTML = ildor;
                        TablicaZapisanychSzkolen.splice(id, 1);
                        mobileInterface.sendReportMessage(''DoradcyDoSzkoleniaWypisywanie_1:'' + data + ", " + godzina + ", " + idszkolenia + ", " + nazwaszkolenia + ", " + dorid + ", 0, 0");
                        /*alert("DoradcyDoSzkoleniaWypisywanie:" + data + ", " + godzina + ", " + idszkolenia + ", " + nazwaszkolenia + ", " + dorid+ ", 0, 0");*/Test_Baza_Wpisz();
                        i = TablicaZapisanychSzkolen.length;
                    }
                } else if (tabela == ''t2'') {
                    /*if(czyobecny==''1'' && czyobecny == TablicaZapisanychSzkolen[ktoryidwtabeli][5]){*/if (CzyZmienicObecnosc == ''1'') {
                        ileDORobecni = document.getElementById(tabela).rows[i].cells[3].innerHTML;
                        ileDORobecni--;
                        document.getElementById(tabela).rows[i].cells[3].innerHTML = ileDORobecni;
                        TablicaZapisanychSzkolen[ktoryidwtabeli] = [data, godzina, idszkolenia, nazwaszkolenia, dorid, ''0'', ''0''];
                        mobileInterface.sendReportMessage(''DoradcyDoSzkoleniaWypisywanieObecnosci_1:'' + data + ", " + godzina + ", " + idszkolenia + ", " + nazwaszkolenia + ", " + dorid + ", 0, 0");
                        Test_Baza_Wpisz();
                        i = TablicaZapisanychSzkolen.length;
                    }
                }
            }
            i++;
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E11:" + tabela + ", " + CzyKasowac + ", " + CzyZmienicObecnosc + ", " + id + ", " + idszkolenia + ", " + nazwaszkolenia + ", " + data + ", " + godzina + ", " + dorid + ", " + czyobecny + ", " + ktoryidwtabeli + ", " + err.message;
    }
}
function KlikNaSzkolenie(tabela, idszkolenia, data, godzina) {
    try {
        var x = document.getElementById("doradcyy");
        var z = document.getElementById(tabela);
        var y = document.getElementById("dataszkolenia");
			var q =document.getElementById("guzikdodajdoszkolenia"); 
				q.style.backgroundColor = ''#996600'';
        var ildor = "NULL";
        var GuzikZapisz = document.getElementById("guzikzapiszszkolenie");
        var GuzikUsun = document.getElementById("guzikusunpusteszkolenie");
        var GuzikZamknij = document.getElementById("guzikzamknijszkolenie");
        var GuzikDodajPoTerminie = document.getElementById("guzikdodajdoszkolenia");
        if (tabela == ''t3'') {
            z.style.display = "block";
            y.style.display = "none";
            x.style.display = "none";
            GuzikZapisz.style.display = "none";
            GuzikZamknij.style.display = "none";
            GuzikDodajPoTerminie.style.display = "none";
            ZrzucTabeleDOR();
        } else if (tabela == ''t2'') {
            y.style.display = "none";
            x.style.display = "block";
            PobierzDoradcow(tabela, idszkolenia, data, godzina);
            GuzikZapisz.style.display = "none";
            GuzikZamknij.style.display = "block";
            GuzikDodajPoTerminie.style.display = "block";
            document.getElementById("dataa").value = data;
            document.getElementById("timee").value = godzina;
            document.getElementById("szkoleniaa").value = idszkolenia;
            if (idszkolenia == "NULL" || data == "NULL" || godzina == "NULL") {
                z.style.display = "block";
                x.style.display = "none";
                y.style.display = "none";
            } else {
                for (var u = 0; u < z.rows.length; u++) {
                    var tabidszk = z.rows[u].innerHTML;
                    var tabdat = z.rows[u].innerHTML;
                    var tabgodz = z.rows[u].innerHTML;
                    var tabildor = z.rows[u].cells[2].innerHTML;
                    tabidszk = tabidszk.substring(44, 80);
                    tabdat = tabdat.substring(83, 93);
                    tabgodz = tabgodz.substring(96, 101);
                    if (tabidszk == idszkolenia && tabdat == data && tabgodz == godzina) {
                        z.rows[u].style.backgroundColor = ''#8888FF'';
                        if (tabildor == 0) {
                            GuzikUsun.style.display = "block";
                        } else {
                            GuzikUsun.style.display = "none";
                        }
                    } else {
                        z.rows[u].style.backgroundColor = ''#ff9900'';
                    }
                }
                for (var i = 0; i < TablicaZapisanychSzkolen.length; i++) {
                    if (TablicaZapisanychSzkolen[i][4] !== "11111111-1111-1111-1111-111111111111") {
                        /*  TablicaZapisanychSzkolen[5] = [''2015-10-05'', ''14:00'', ''0A235B59-C973-4DE3-AFAB-086A37351941'', ''SWD (stare)'', ''11111111-1111-1111-1111-111111111111'',''1'',''0''];  TablicaZapisanychSzkolen[6] = [''2015-10-05'', ''14:00'', ''0A235B59-C973-4DE3-AFAB-086A37351941'', ''SWD (stare)'', ''47BD48C6-615F-469B-B480-27F5EA2D15A9'',''1'',''0''];  TablicaZapisanychSzkolen[7] = [''2015-10-05'', ''14:00'', ''0A235B59-C973-4DE3-AFAB-086A37351941'', ''SWD (stare)'', ''8A632A65-5B07-4C01-979B-A987152E2A37'',''1'',''0''];            */var data123;
                        var czas123;
                        var idszkolenia123;
                        var dorid123;
                        var obecny123;
                        data123 = TablicaZapisanychSzkolen[i][0];
                        czas123 = TablicaZapisanychSzkolen[i][1];
                        idszkolenia123 = TablicaZapisanychSzkolen[i][2];
                        dorid123 = TablicaZapisanychSzkolen[i][4];
                        obecny123 = TablicaZapisanychSzkolen[i][5];
                        if (TablicaZapisanychSzkolen[i][2] == idszkolenia && TablicaZapisanychSzkolen[i][0] == data && TablicaZapisanychSzkolen[i][1] == godzina && TablicaZapisanychSzkolen[i][5] == ''1'') {
                            for (j = 0; j < x.length; j++) {
                                if (TablicaZapisanychSzkolen[i][4] == x.options[j].value) {
                                    x.options[j].selected = true;
                                    j = x.length;
                                }
                            }
                            /*for (var j = 0; j < x.length; j++) {          var tymczas6;          tymczas6 = TablicaDoradcow[j][0];          if (TablicaZapisanychSzkolen[i][4] == TablicaDoradcow[j][0]) {           x.options[j].selected = true;          }         }*/
                        }
                    }
                }
            }
        } else {
            /*gdy t3*/y.style.display = "none";
            x.style.display = "block";
            PobierzDoradcow(''t1'');
            GuzikZapisz.style.display = "none";
            GuzikZamknij.style.display = "none";
            GuzikDodajPoTerminie.style.display = "none";
            for (var t = 0; t < TablicaDoradcow.length; t++) {
                x.options[t].selected = false;
            }
            document.getElementById("dataa").value = data;
            document.getElementById("timee").value = godzina;
            document.getElementById("szkoleniaa").value = idszkolenia;
            if (idszkolenia == "NULL" || data == "NULL" || godzina == "NULL") {
                z.style.display = "block";
                x.style.display = "none";
                y.style.display = "none";
            } else {
                for (var u = 0; u < z.rows.length; u++) {
                    var tabidszk = z.rows[u].innerHTML;
                    var tabdat = z.rows[u].innerHTML;
                    var tabgodz = z.rows[u].innerHTML;
                    var tabildor = z.rows[u].cells[2].innerHTML;
                    tabidszk = tabidszk.substring(44, 80);
                    tabdat = tabdat.substring(83, 93);
                    tabgodz = tabgodz.substring(96, 101);
                    if (tabidszk == idszkolenia && tabdat == data && tabgodz == godzina) {
                        z.rows[u].style.backgroundColor = ''#8888FF'';
                        if (tabildor == 0) {
                            GuzikUsun.style.display = "block";
                        } else {
                            GuzikUsun.style.display = "none";
                        }
                    } else {
                        z.rows[u].style.backgroundColor = ''#ff9900'';
                    }
                }
                for (var i = 0; i < TablicaZapisanychSzkolen.length; i++) {
                    if (TablicaZapisanychSzkolen[i][2] == idszkolenia && TablicaZapisanychSzkolen[i][0] == data && TablicaZapisanychSzkolen[i][1] == godzina) {
                        for (var j = 0; j < TablicaDoradcow.length; j++) {
                            if (TablicaZapisanychSzkolen[i][4] == TablicaDoradcow[j][0]) {
                                x.options[j].selected = true;
                            }
                        }
                    }
                }
            }
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E12: " + err.message;
    }
}
function CzyJestTakieSzkolenie(idszkolenia, data, godzina) {
    try {
        var tymczas = TablicaZapisanychSzkolen.length;
        var tymczasowa = ''NULL'';
        for (var i = 0; i < tymczas; i++) {
            if (idszkolenia == TablicaZapisanychSzkolen[i][2] && data == TablicaZapisanychSzkolen[i][0] && godzina == TablicaZapisanychSzkolen[i][1]) {
                tymczasowa = ''1'';
                i = TablicaZapisanychSzkolen.length;
            }
        }
        return tymczasowa;
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E13: " + err.message;
    }
}
/*     function CzyJestTakieSzkolenie(idszkolenia, data) {      try {       var tymczas = TablicaZapisanychSzkolen.length;       var tymczasowa = ''NULL'';       for (var i = 0; i < tymczas; i++) {        if (idszkolenia == TablicaZapisanychSzkolen[i][2] && data == TablicaZapisanychSzkolen[i][0]) {         tymczasowa = ''1'';         i = TablicaZapisanychSzkolen.length;        }       }       return tymczasowa;      } catch (err) {       document.getElementById("ERROR").innerHTML = err.message;      }     }*/function CzyDorZapisanyNaToSzkolenie(idszkolenia, data, godzina, doradca) {
    try {
        var tymczasowa = ''NULL'';
        var caladatazew = data + " " + godzina;
        for (var i = 0; i < TablicaZapisanychSzkolen.length; i++) {
            var caladatawew = TablicaZapisanychSzkolen[i][0] + " " + TablicaZapisanychSzkolen[i][1];
            if (TablicaZapisanychSzkolen[i][4] == doradca && TablicaZapisanychSzkolen[i][2] == idszkolenia && caladatawew == caladatazew) {
                tymczasowa = 1;
            }
        }
        return tymczasowa;
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E14: " + err.message;
    }
}
function CzyObecny(idszkolenia, data, godzina, doradca) {
    try {
        var ob;
        ob = 0;
        for (i = 0; i < TablicaZapisanychSzkolen.length; i++) {
            if (idszkolenia == TablicaZapisanychSzkolen[i][2] && data == TablicaZapisanychSzkolen[i][0] && godzina == TablicaZapisanychSzkolen[i][1] && TablicaZapisanychSzkolen[i][4] == doradca) {
                ob = TablicaZapisanychSzkolen[i][5];
                i = TablicaZapisanychSzkolen.length;
            }
        }
        return ob;
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E10: " + err.message;
    }
}
function CzyObecnoscZmieniona(idszkolenia, data, godzina, doradca, obecnosc) {
    try {
        var tymczasowa = ''NULL'';
        for (var i = 0; i < TablicaZapisanychSzkolen.length; i++) {
            if (idszkolenia == TablicaZapisanychSzkolen[i][2] && data == TablicaZapisanychSzkolen[i][0] && godzina == TablicaZapisanychSzkolen[i][1] && TablicaZapisanychSzkolen[i][4] == doradca && TablicaZapisanychSzkolen[i][5] !== obecnosc) {
                tymczasowa = 1;
                i = TablicaZapisanychSzkolen.length;
            }
        }
        return tymczasowa;
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E15: " + err.message;
    }
}
function SubmitNew() {
    try {
        var Data = document.getElementById("dataa").value;
        var Time = document.getElementById("timee").value;
        var IdSzkolenia = document.getElementById("szkoleniaa").value;
        var tabela = KtoraTabela(Data, Time, ''0'');
        if (IdSzkolenia == "NULL" || Data == "NULL" || Time == "NULL") {} else {
            for (i = 0; i < TablicaSzkolen.length; i++) {
                /*wyszukuje nazwy szkolenia dla danego IdSzkolenia*/var NazwaSzkolenia = "NULL";
                if (IdSzkolenia == TablicaSzkolen[i][0]) {
                    NazwaSzkolenia = TablicaSzkolen[i][1];
                    i = TablicaSzkolen.length;
                }
            }
            IleZaznaczonychDOR();
            var InvForm = document.forms.form;
            var Doradca = "";
            var x = 0;
            var t = "NULL";
            var obecnosc = "NULL";
			var test = PoTerminie;
            /*  TablicaDoradcow[1]=[''47BD48C6-615F-469B-B480-27F5EA2D15A9'',''NULL'',''Krystyna'',''Jonas'',''Bajko''];   TablicaDoradcow[6]=[''8A632A65-5B07-4C01-979B-A987152E2A37'',''NULL'',''Beata'',''Sidorka'',''Bajko''];   */
			if (IleZaznaczonych > 1) {
                for (x = 0; x < InvForm.doradcyy.length; x++) {
                    Doradca = InvForm.doradcyy[x].value;
                    t = CzyDorZapisanyNaToSzkolenie(IdSzkolenia, Data, Time, Doradca);
                    if (InvForm.doradcyy[x].selected) {
                        /*dla wszystkich zaznaczonych*/if (tabela == ''t1'') {
                            if (t == "NULL") {
                                AddDorToSzkolenia(''NOWY'', IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca, tabela, ''0'');
                            }
                        } else if (tabela == ''t2'') {
                            if (PoTerminie == ''NULL'') {
                                AddDorToSzkolenia(''NOWY'', IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca, tabela, ''1'');
                            } else if (PoTerminie == ''1'') {
                                if (t == "NULL") {
                                    /*alert(''zaznaczony'' + Doradca);*/
                                    /*function AddDorToSzkolenia(sterujaca, idszkolenia, nazwaszkolenia, data, Time, Doradca, tabela, Czyobecny) {*/
									AddDorToSzkolenia(''PoTerminie'', IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca, tabela, ''0'');
									var q =document.getElementById("guzikdodajdoszkolenia"); 
										q.style.backgroundColor = ''#996600'';
                                }
                            }
                        }

                    } else if (!(InvForm.doradcyy[x].selected)) {
                        /*dla wszystkich odznaczonych*/if (tabela == ''t1'') {
                            Doradca = InvForm.doradcyy[x].value;
                            Wykasuj(tabela, IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca, ''1'');
                        } else if (tabela == ''t2'') {
                            if (PoTerminie == ''NULL'') {
                                Doradca = InvForm.doradcyy[x].value;
                                obecnosc = CzyObecny(IdSzkolenia, Data, Time, Doradca);
                                var czyzmieniam = CzyObecnoscZmieniona(IdSzkolenia, Data, Time, Doradca, ''0'');
                                if (czyzmieniam == ''1'') {
                                    Wykasuj(tabela, IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca, ''1'');
                                }
                            } else if (PoTerminie == ''1'') {/*POTERMINIE RAZRAZRAZ ODZNACZENI*/}
                        }
                    }
                }
            } else if (IleZaznaczonych == 1) {
                for (x = 0; x < InvForm.doradcyy.length; x++) {
                    Doradca = InvForm.doradcyy[x].value;
                    t = CzyDorZapisanyNaToSzkolenie(IdSzkolenia, Data, Time, Doradca);
                    if (InvForm.doradcyy[x].selected) {
                        if (tabela == ''t1'') {
                            AddDorToSzkolenia(''NOWY1'', IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca, tabela, ''0'');
                        } else if (tabela == ''t2'') {
                            if (PoTerminie == ''NULL'') {
                                AddDorToSzkolenia(''NOWY'', IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca, tabela, ''1'');
                            } else if (PoTerminie == ''1'') {
                                /*POTERMINIE RAZRAZRAZ*/if (t == "NULL") {
                                    /*alert(''zaznaczony'' + Doradca);*/
                                    AddDorToSzkolenia(''PoTerminie'', IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca, tabela, ''0'');
									var q =document.getElementById("guzikdodajdoszkolenia"); 
										q.style.backgroundColor = ''#996600'';
                                }
                            }
                        }
                    } else if (!(InvForm.doradcyy[x].selected)) {
                        if (tabela == ''t1'') {
                            Wykasuj(tabela, IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca);
                        } else if (tabela == ''t2'') {
                            if (PoTerminie == ''NULL'') {
                                obecnosc = CzyObecny(IdSzkolenia, Data, Time, Doradca);
                                var czyzmieniam = CzyObecnoscZmieniona(IdSzkolenia, Data, Time, Doradca, ''0'');
                                if (czyzmieniam == ''1'') {
                                    Wykasuj(tabela, IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca, ''1'');
                                }
                            } else if (PoTerminie == ''1'') {/*POTERMINIE RAZRAZRAZ*/}
                        } else {}
                    }
                }
            } else if (IleZaznaczonych == 0) {
                for (var x = 0; x < InvForm.doradcyy.length; x++) {
                    Doradca = InvForm.doradcyy[x].value;
                    obecnosc = CzyObecny(IdSzkolenia, Data, Time, Doradca);
                    if (tabela == ''t1'') {
                        var CzyZapisany = CzyDorZapisanyNaToSzkolenie(IdSzkolenia, Data, Time, Doradca);
                        if (CzyZapisany == ''1'') {
                            Wykasuj(tabela, IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca, obecnosc);
                        }
                    } else if (tabela == ''t2'' && Doradca !== ''11111111-1111-1111-1111-111111111111'') {
                        var czyzmieniam = CzyObecnoscZmieniona(IdSzkolenia, Data, Time, Doradca, ''0'');
                        if (czyzmieniam == ''1'') {
                            Wykasuj(tabela, IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca, ''0'');
                        } else {}
                    }
                }
                /*              if (x == InvForm.doradcyy.length) {                  Doradca = "";                  AddDorToSzkolenia(''Puste'', IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca);              }*/
            } else {
                alert("ERROR?");
            }
        }
        if (PoTerminie = "1") {
            KlikNaSzkolenie(tabela, IdSzkolenia, Data, Time, NazwaSzkolenia);
            PoTerminie = ''NULL'';
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E16: " + err.message;
    }
}
function cos() {
    try {
        alert(TablicaZapisanychSzkolen.length);
        document.getElementById("ERROR").innerHTML = "";
        for (var i = 0; i < TablicaZapisanychSzkolen.length; i++) {
            document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "TabZapSzk [" + i + "]: " + TablicaZapisanychSzkolen[i];
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E17: " + err.message;
    }
}
function IleZaznaczonychDOR() {
    try {
        var InvForm = document.forms.form;
        IleZaznaczonych = 0;
        for (x = 0; x < InvForm.doradcyy.length; x++) {
            if (InvForm.doradcyy[x].selected) {
                IleZaznaczonych++;
            }
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E18: " + err.message;
    }
}
function Wykasuj(tabela, idszkolenia, nazwaszkolenia, data, godzina, iddor, czyobecny) {
    try {
        var ktoryzapisanychszkoleniach;
        for (var x = 0; x < TablicaZapisanychSzkolen.length; x++) {
            if (iddor == TablicaZapisanychSzkolen[x][4] && idszkolenia == TablicaZapisanychSzkolen[x][2] && data == TablicaZapisanychSzkolen[x][0] && godzina == TablicaZapisanychSzkolen[x][1]) /*kasuje*/{
                ktoryzapisanychszkoleniach = KtoryWTabeli(idszkolenia, data, godzina, iddor, TablicaZapisanychSzkolen[x][5]);
                ModyfikacjaWierszaSzkolenia(tabela, ''1'', ''1'', x, idszkolenia, nazwaszkolenia, data, godzina, iddor, czyobecny, ktoryzapisanychszkoleniach);
                x = TablicaZapisanychSzkolen.length;
            }
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E19: " + err.message;
    }
}
function ZerujSzkolenia(tabela) {
    try {
        var x = document.getElementById("doradcyy");
        var z = document.getElementById(tabela);
        for (var j = 0; j < TablicaDoradcow.length; j++) {
            x.options[j].selected = false;
        }
        for (var u = 0; u < z.rows.length; u++) {
            z.rows[u].style.backgroundColor = ''#ff9900'';
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E20: " + err.message;
    }
}
function PobieranieWszystkiego() {
    try {
        var x = document.getElementById("doradcyy");
        var y = document.getElementById("dataszkolenia");
        var GuzikZapisz = document.getElementById("guzikzapiszszkolenie");
        var GuzikUsun = document.getElementById("guzikusunpusteszkolenie");
        x.style.display = "none";
        y.style.display = "none";
        GuzikZapisz.style.display = "none";
        GuzikUsun.style.display = "none";'+tempo.mobile.udf_ZoomToResizeReport()+'
        
        PobierzSzkoleniaGora();
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E21: " + err.message;
    }
    try {
        PobierzDoradcow(''t1'');
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E22: " + err.message;
    }
    try {
        Test_Baza_Sciagnij();
        PobierzSzkoleniaDol();
        pokaz_ukryj(''t1_0'', ''t2_0'', ''t1'', ''t2'', ''t3'');
        /*pokaz_ukryj(''t1_0'',''t2_0'',''dvv'',''dvv2'', ''dvv3'');*/
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E23: " + err.message;
    }
}
function DodajPusteSzkolenie(sterujaca) {
    try {
        var tabela;
        if (sterujaca == 0) {
            PobierzDoradcow(''t1'');
            ZerujSzkolenia(''t1'');
            var Time = document.getElementById("dataa");
            var Data = document.getElementById("timee");
            var IdSzkolenia = document.getElementById("szkoleniaa");
            tabela = KtoraTabela(Data, Time, ''0'');
            Time.value = "";
            Data.value = "";
            IdSzkolenia = "NULL";
            var x = document.getElementById("doradcyy");
            /*var z = document.getElementById("t1");*/var y = document.getElementById("dataszkolenia");
            var GuzikZapisz = document.getElementById("guzikzapiszszkolenie");
            var GuzikUsun = document.getElementById("guzikusunpusteszkolenie");
            GuzikUsun.style.display = "none";
            x.style.display = "none";
            y.style.display = "block";
            GuzikZapisz.style.display = "block";
        } else {
            var Doradca = "11111111-1111-1111-1111-111111111111";
            Data = document.getElementById("dataa").value;
            Time = document.getElementById("timee").value;
            IdSzkolenia = document.getElementById("szkoleniaa").value;
            tabela = KtoraTabela(Data, Time, ''0'');
            var CzySzkolenie = CzyJestTakieSzkolenie(IdSzkolenia, Data, Time);
            var GuzikZapisz = document.getElementById("guzikzapiszszkolenie");
            var y = document.getElementById("dataszkolenia");
            if (Data == "" || Time == "" || CzySzkolenie == "1" || IdSzkolenia == "NULL") {} else {
                for (i = 0; i < TablicaSzkolen.length; i++) {
                    /*wyszukuje nazwy szkolenia dla danego IdSzkolenia*/var NazwaSzkolenia = "NULL";
                    if (IdSzkolenia == TablicaSzkolen[i][0]) {
                        NazwaSzkolenia = TablicaSzkolen[i][1];
                        i = TablicaSzkolen.length;
                    }
                }
                GuzikZapisz.style.display = "none";
                y.style.display = "none";
                DodNowyWierszSzkolenia(tabela, ''0'', IdSzkolenia, NazwaSzkolenia, Data, Time, Doradca, ''0'');
                KlikNaSzkolenie(tabela, IdSzkolenia, Data, Time, NazwaSzkolenia);
            }
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E24: " + err.message;
    }
}
function KasowaniePustegoSzkolenia() {
    try {
        var listador = document.getElementById("doradcyy");
        var DataDoWykasowania = document.getElementById("dataa").value;
        var TimeDoWykasowania = document.getElementById("timee").value;
        var Time = DataDoWykasowania + '' '' + TimeDoWykasowania;
        var tabela = KtoraTabela(DataDoWykasowania, TimeDoWykasowania, ''0'');
        var IdSzkoleniaDoWykasowania = document.getElementById("szkoleniaa").value;
        var tablica = document.getElementById(tabela);
        var GuzikUsun = document.getElementById("guzikusunpusteszkolenie");
        var Doradca = "11111111-1111-1111-1111-111111111111";
        for (i = 0; i < TablicaSzkolen.length; i++) {
            /*wyszukuje nazwy szkolenia dla danego IdSzkolenia*/var NazwaSzkolenia = "NULL";
            if (IdSzkoleniaDoWykasowania == TablicaSzkolen[i][0]) {
                NazwaSzkolenia = TablicaSzkolen[i][1];
                i = TablicaSzkolen.length;
            }
        }
        for (i = 0; i < TablicaZapisanychSzkolen.length; i++) {
            if (TablicaZapisanychSzkolen[i][0] == DataDoWykasowania && TablicaZapisanychSzkolen[i][1] == TimeDoWykasowania && TablicaZapisanychSzkolen[i][2] == IdSzkoleniaDoWykasowania && TablicaZapisanychSzkolen[i][4] == Doradca) {
                TablicaZapisanychSzkolen.splice(i, 1);
                /*Kasuje z TablicyZapisanychSzkolen dane puste szkolenie*/
            }
        }
        for (var i = 0; i < tablica.rows.length; i++) {
            var idszk = tablica.rows[i].innerHTML;
            var tabdat = tablica.rows[i].innerHTML;
            var tabgodz = tablica.rows[i].innerHTML;
            idszk = idszk.substring(44, 80);
            tabdat = tabdat.substring(83, 93);
            tabgodz = tabgodz.substring(96, 101);
            if (idszk == IdSzkoleniaDoWykasowania && tabdat == DataDoWykasowania && tabgodz == TimeDoWykasowania) {
                tablica.rows[i].cells[0].innerHTML = "";
                tablica.rows[i].cells[1].innerHTML = "";
                tablica.rows[i].cells[2].innerHTML = "";
                tablica.deleteRow(i);
                mobileInterface.sendReportMessage(''DoradcyDoSzkoleniaWypisywanie_1:'' + DataDoWykasowania + ", " + TimeDoWykasowania + ", " + IdSzkoleniaDoWykasowania + ", " + NazwaSzkolenia + ", " + Doradca + ", 0, 0");
                Test_Baza_Wpisz();
                GuzikUsun.style.display = "none";
                i = tablica.rows.length;
            }
        }
        listador.style.display = "none";
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E25: " + err.message;
    }
}
/*Data,godzina,idszkolenia,nazwaszkolenia,dorid,TrainingPresence,TrainingClose*/function KtoraTabela(data, godzina, trainingclose) {
    try {
        var data_wew = AktualnaData;
        var tabela = ''t1'';
        pokaz_ukryj(''t1_0'', ''t2_0'', ''t1'', ''t2'', ''t3'');
        /*pokaz_ukryj(''t1_0'',''t2_0'',''dvv'',''dvv2'',''dvv3'');*/if (data + " " + godzina < data_wew) {
            if (trainingclose == 0) {
                tabela = ''t2'';
                pokaz_ukryj(''t2_0'', ''t1_0'', ''t2'', ''t1'', ''t3'');
                /*pokaz_ukryj(''t2_0'',''t1_0'',''dvv2'',''dvv'',''dvv3'');*//*document.getElementById("ERROR2").innerHTML=document.getElementById("ERROR2").innerHTML + ''s_p'' ;*/
            } else {
                tabela = ''t3'';
                pokaz_ukryj(''t2_0'', ''t1_0'', ''t3'', ''t1'', ''t2'');
                /*pokaz_ukryj(''t2_0'',''t1_0'',''dvv3'',''dvv'',''dvv2'');*//*document.getElementById("ERROR2").innerHTML=document.getElementById("ERROR2").innerHTML + ''s_p_i_z'';*/
            }
        }
        return tabela;
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E26: " + err.message;
    }
}
function KtoryWTabeli(idszkolenia, data, godzina, doradca, obecnosc, sterujaca) {
    try {
        var tymczasowa = ''NULL'';
        for (var i = 0; i < TablicaZapisanychSzkolen.length; i++) {
            var temp_idszkolenia = TablicaZapisanychSzkolen[i][2];
            var temp_data = TablicaZapisanychSzkolen[i][0];
            var temp_godzina = TablicaZapisanychSzkolen[i][1];
            var temp_doradca = TablicaZapisanychSzkolen[i][4];
            var temp_obecnosc = TablicaZapisanychSzkolen[i][5];
            if (sterujaca == "PoTerminie") {
                tymczasowa = TablicaZapisanychSzkolen.length;
                i = TablicaZapisanychSzkolen.length;
            } else {
                if (idszkolenia == TablicaZapisanychSzkolen[i][2] && data == TablicaZapisanychSzkolen[i][0] && godzina == TablicaZapisanychSzkolen[i][1] && TablicaZapisanychSzkolen[i][4] == doradca) {
                    tymczasowa = i;
                    i = TablicaZapisanychSzkolen.length;
                }
            }
        }
        return tymczasowa;
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E27: " + err.message;
    }
}
function Test_Baza_Sciagnij() {
    try {
        if (mobileInterface.containsKey("TablicaZapisanychSzk")) {
            var ReturnValue;
            var obiekt;
            TablicaZapisanychSzkolen.length = 0;
            ReturnValue = mobileInterface.getValue("TablicaZapisanychSzk");
            obiekt = JSON.parse(ReturnValue);
            for (i = 0; i < obiekt.length; i++) {
                TablicaZapisanychSzkolen.push(obiekt[i]);
            }
            /*for(i = 0; i < obiekt.length; i++){      document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + " OBIEKT["+ i +"]: "+obiekt[i];     }     for(i = 0; i < TablicaZapisanychSzkolen.length; i++){      document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + " TABLICAZAPISANYCHSZKOLEN["+ i +"]: "+TablicaZapisanychSzkolen[i];     }  */
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E28: " + err.message;
    }
}
function Test_Baza_Wpisz() {
    try {
        var value;
        value = JSON.stringify(TablicaZapisanychSzkolen);
        mobileInterface.setKeyValue("TablicaZapisanychSzk", value);
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E29: " + err.message;
    }
}
function DodajDoSzkoleniaPoTerminie() {
    try {
		/*.style.backgroundColor = ''#8888FF''; Highlight*/
		/*var q =document.getElementById("guzikdodajdoszkolenia"); q.style.backgroundColor = ''#ff9900''; normal*/
		/*id="guzikdodajdoszkolenia"*/
        /*PobierzDoradcow(tabela, idszkolenia, data, godzina)*/PoTerminie = ''1'';
        PobierzDoradcow(''t1'');
        /*function KlikNaSzkolenie(tabela, idszkolenia, data, godzina) {*/
		var x = document.getElementById("doradcyy");
        var z = document.getElementById(''t2'');
        var y = document.getElementById("dataszkolenia");
			z.style.display = "block";
			y.style.display = "none";
			x.style.display = "block";
		var q =document.getElementById("guzikdodajdoszkolenia");
			q.style.backgroundColor = ''#8888FF'';

        var data = document.getElementById("dataa").value;
        var godzina = document.getElementById("timee").value;
        var idszkolenia = document.getElementById("szkoleniaa").value;
        for (var i = 0; i < TablicaZapisanychSzkolen.length; i++) {
            if (TablicaZapisanychSzkolen[i][4] !== "11111111-1111-1111-1111-111111111111") {
                /*  TablicaZapisanychSzkolen[5] = [''2015-10-05'', ''14:00'', ''0A235B59-C973-4DE3-AFAB-086A37351941'', ''SWD (stare)'', ''11111111-1111-1111-1111-111111111111'',''1'',''0''];  TablicaZapisanychSzkolen[6] = [''2015-10-05'', ''14:00'', ''0A235B59-C973-4DE3-AFAB-086A37351941'', ''SWD (stare)'', ''47BD48C6-615F-469B-B480-27F5EA2D15A9'',''1'',''0''];  TablicaZapisanychSzkolen[7] = [''2015-10-05'', ''14:00'', ''0A235B59-C973-4DE3-AFAB-086A37351941'', ''SWD (stare)'', ''8A632A65-5B07-4C01-979B-A987152E2A37'',''1'',''0''];            */var data123;
                var czas123;
                var idszkolenia123;
                var dorid123;
                var obecny123;
                data123 = TablicaZapisanychSzkolen[i][0];
                czas123 = TablicaZapisanychSzkolen[i][1];
                idszkolenia123 = TablicaZapisanychSzkolen[i][2];
                dorid123 = TablicaZapisanychSzkolen[i][4];
                obecny123 = TablicaZapisanychSzkolen[i][5];
                if (TablicaZapisanychSzkolen[i][2] == idszkolenia && TablicaZapisanychSzkolen[i][0] == data && TablicaZapisanychSzkolen[i][1] == godzina) {
                    for (j = 0; j < x.length; j++) {
                        if (TablicaZapisanychSzkolen[i][4] == x.options[j].value) {
                            x.options[j].selected = true;
                            j = x.length;
                        }
                    }
                    /*for (var j = 0; j < x.length; j++) {          var tymczas6;          tymczas6 = TablicaDoradcow[j][0];          if (TablicaZapisanychSzkolen[i][4] == TablicaDoradcow[j][0]) {           x.options[j].selected = true;          }         }*/
                }
            }
        }
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E30: " + err.message;
    }
}
function ZamknijSzkolenie() {
    try {
        var data = document.getElementById("dataa").value;
        var godzina = document.getElementById("timee").value;
        var idszkolenia = document.getElementById("szkoleniaa").value;
        var datadozamkniecia = null ;
        var godzinadozamkniecia = null ;
        var idszkoleniadozamkniecia = null ;
        for (i = 0; i < TablicaZapisanychSzkolen.length; i++) {
            if (idszkolenia == TablicaZapisanychSzkolen[i][2] && data == TablicaZapisanychSzkolen[i][0] && godzina == TablicaZapisanychSzkolen[i][1]) {
                datadozamkniecia = TablicaZapisanychSzkolen[i][0];
                godzinadozamkniecia = TablicaZapisanychSzkolen[i][1];
                idszkoleniadozamkniecia = TablicaZapisanychSzkolen[i][2];
                /*TO JEST JESZCZE NIE SZKO?CZONE*/TablicaZapisanychSzkolen[i] = [TablicaZapisanychSzkolen[i][0], TablicaZapisanychSzkolen[i][1], TablicaZapisanychSzkolen[i][2], TablicaZapisanychSzkolen[i][3], TablicaZapisanychSzkolen[i][4], TablicaZapisanychSzkolen[i][5], ''1''];
                Test_Baza_Wpisz();
            }
        }
        /*alert("Zamykam Szkolenie \nNazwa Szkolenia: "+TablicaZapisanychSzkolen[i][3]+" \ndata:"+TablicaZapisanychSzkolen[i][0]+" "+TablicaZapisanychSzkolen[i][1]+"\nzamkni?te: "+TablicaZapisanychSzkolen[i][6]);*/mobileInterface.sendReportMessage(''ZamykanieSzkolenia_1:'' + datadozamkniecia + ", " + godzinadozamkniecia + ", " + idszkoleniadozamkniecia);
        ReloadPage();
    } catch (err) {
        document.getElementById("ERROR").innerHTML = document.getElementById("ERROR").innerHTML + "E31: " + err.message;
    }
}
function ReloadPage() {
    ZrzucTabeleSzkolenGora();
    ZrzucTabeleSzkoleniaDol();
    PobieranieWszystkiego();
}
</script>  

<div id="strona">   

		 <div id="dataszkoleniaguziki"> 
			<div id="guzik1">
				<table> 
					<tr> 
						<td>    
							<ul>     
								<a href="javascript:void(DodajPusteSzkolenie(0))">Dodaj nowe szkolenie</a>   
							</ul> 
						</td>
					</tr>   
				</table>   
			</div>  
			   <div id="dataszkolenia">    
				   <div id="dataczas">     
					   godzina:<input  id="timee" type="time" class="dataczas1"/>   
					   Data:<input id="dataa" Type="date" class="dataczas1" />     
				   </div>    
					   <div id="szkolenia">    
						   <select id="szkoleniaa" size="1" class="szkolenia1">      
							<option value="NULL" selected>Wybierz szkolenie</option> 
						   </select>    
					   </div>  			   
			   </div>
	<div id="guzikzapiszszkolenie"> 
	   <td >  
			<ul>   
				<a href="javascript:void(DodajPusteSzkolenie(1))">Zapisz szkolenie</a>    
			</ul>   
	   </td>  
   </div> 		
			 	<div id="hist_szkolenia">  
				   <table id="table_zakladki"> 
					   <tr>    
							<td id="td_zakladki">  
							   <ul>      
									<a id="td_zakladki_1" href="javascript:void(pokaz_ukryj(''t1_0'',''t2_0'',''t1'',''t2'', ''t3'',1))">Zaplanowane Szkolenia</a>  
							   </ul>   
							</td>
							<td id="td_zakladki">  
							   <ul>      
									<a id="td_zakladki_2" href="javascript:void(pokaz_ukryj(''t2_0'',''t1_0'',''t2'',''t1'', ''t3'',1))">Szkolenia do zamkni�cia</a>  
							   </ul>   
							</td>  
							<td id="td_zakladki">  
							   <ul>      
									<a id="td_zakladki_3" href="javascript:void(pokaz_ukryj(''t2_0'',''t1_0'',''t3'',''t1'', ''t2'',1))">Zrealizowane Szkolenia</a>  
							   </ul>   
							</td>					   					   
					   </tr>  
				   </table>  
			   </div>
			<div id="Tabela_tytyl">
			   <table id="t1_0"> 
				   <col width="400px" />   
				   <col width="200px" />  
				   <col width="200px" />     
					   <tr>      
						   <td>NazwaSzkolenia</td>   
						   <td>DataSzkolenia</td>    
						   <td>Ilosc DOR</td>      
					   </tr>    
				   </table>  
			    <table id="t2_0"> 
					<col width="350px" />   
					<col width="200px" /> 
					<col width="125px" />  
					<col width="125px" />   				   
						<tr>      
							<td>NazwaSzkolenia</td>   
							<td>DataSzkolenia</td>    
							<td>Ilosc DOR</td>  
							<td>Obecni DOR</td>
					   </tr>    
				   </table>
			</div>  
		   <div id="dvv">      
			   <table id="t1">       
				   <col width="400px" /> 
				   <col width="200px" /> 
				   <col width="200px" />     
			   </table>    
		   </div> 
		   <div id="dvv2">      
			   <table id="t2">       
					<col width="350px" />   
					<col width="200px" /> 
					<col width="125px" />  
					<col width="125px" />
			   </table>    
		   </div> 
		   <div id="dvv3">      
			   <table id="t3">       
					<col width="350px" />   
					<col width="200px" /> 
					<col width="125px" />  
					<col width="125px" />       
			   </table>    
		   </div> 
									
					<p id="ERROR"></p> 

					<div>
						<ul>     
							<a id="guzikusunpusteszkolenie"href="javascript:void(KasowaniePustegoSzkolenia())">Usun puste szkolenie</a>    
						</ul> 
						<ul>     
							<a id="guzikzamknijszkolenie"href="javascript:void(ZamknijSzkolenie())">Zamknij szkolenie</a>    
						</ul> 
						<ul>    
							<a id="guzikdodajdoszkolenia"href="javascript:void(DodajDoSzkoleniaPoTerminie())">Dodaj DOR po Terminie</a>  
						</ul> 
					</div>
</div>

		</div>    		
			   <div id="doradcy">    
				   <form name="form">  
				   <select onchange="SubmitNew()" id="doradcyy" name="doradcyy" size="1000" multiple class="doradcy1">   
				   </select>  
				   </form> 
			   </div>  
	</div>
</body>
'
--set @html=@html+@style+@funkcje+@strona

select @html

select Substring(@html,0,43699)
select Substring(@html,43680,109225)















