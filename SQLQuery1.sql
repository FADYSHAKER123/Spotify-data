select * from dbo.['spotify-2023$']

select count(*) 
from dbo.['spotify-2023$']

select * from dbo.['spotify-2023$']
 where [track_name] is null 

 SELECT COUNT (streams)
FROM ['spotify-2023$']
WHERE streams IS NULL ;


select [artist(s)_name],[track_name],
CONCAT (DA ,'/' ,MO,'/',YE)
as [full date] 
from dbo.['spotify-2023$']
where ye =2023

SELECT count([track_name])
 AS [COUNT TRACKS] ,
             ye
	from  dbo.['spotify-2023$']
		where ye >=2020
	group by ye
	order by ye desc;
	

select  [track_name] ,
        [artist(s)_name],
        streams 
	from dbo.['spotify-2023$']
	where streams = 
	(select MAX(streams)from dbo.['spotify-2023$']);

	select mo,
	 round(AVG(streams),0) as '[average_stream]'
	from dbo.['spotify-2023$']
	Where YE ='2023'
	Group BY mo
	order by mo desc ;


select 
ye ,
(count([track_name])*100 /
(select count ([track_name])from ['spotify-2023$'])) as 
percentage 
from  ['spotify-2023$']
group by ye 
order by percentage desc ;




  

 select * from (
select [artist(s)_name]  , ye,
streams, 
rank () over( partition by ye order by streams )  
as [stream rank]  
from dbo.['spotify-2023$'])tbl
where[stream rank]=1;





select [track_name] ,
[artist(s)_name],
[in_spotify_playlists] ,
ntile(3) over(order by [in_spotify_playlists]) 
from Dbo.['spotify-2023$']
order by [in_spotify_playlists] desc
//////////////////////////////////////////////

select [track_name] ,
[artist(s)_name],
[in_spotify_playlists] ,
ntile(4) over(order by [in_spotify_playlists]) 
from Dbo.['spotify-2023$']
order by [in_spotify_playlists] desc
////////////////////////////////////////////////////////



 
with cte_hh as(
select  mo ,count(streams)  
from Dbo.['spotify-2023$']
group by 1,2 ) 
 select ye , AVG(streams)
from cte_hh
group by 1
 
/////////////////////////////////////////////////



 



select 
ye ,
(count([track_name])*100 / (select count ([track_name])from
['spotify-2023$'])) as 
percentage 
from  ['spotify-2023$']
group by ye 
order by percentage desc ;


select ye,
[track_name],
[danceability_%],
rank ()over(order by [danceability_%]desc) as dance 
from ['spotify-2023$']
where ye = 2022

select * from
(
select ye,
[track_name],
[danceability_%],
rank ()over(partition by ye order by 
[danceability_%] desc ) as dance
from ['spotify-2023$']) tbl
where ye>2020



select ye,
[track_name],
[artist(s)_name],
streams , 
rank ()over(order by streams desc) as [stream rank]  
from ['spotify-2023$']
where ye >=2020
order by [stream rank] , ye desc 

select  
max(in_spotify_playlists) as [max play list] ,
[track_name]
from ['spotify-2023$']  
where ye =2020
group by [track_name]
order by [max play list] desc ; 



