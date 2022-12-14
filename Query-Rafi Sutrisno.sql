
-- no 1
select bulan,  count(*) as jumlah_game_dibeli
from game, (select extract(month from transaksi.TR_TGLBELI) as bulan,Detail_Transaksi_Game.Game_G_ID
	from transaksi inner join Detail_Transaksi_Game on TR_ID = Detail_Transaksi_Game.Transaksi_TR_ID) as detail_TR
where game.G_ID = detail_TR.Game_G_ID
group by bulan
order by bulan;

-- no 2
select D_ID, D_NAMA, count(*) as jumlah_bahasa_digunakan
from(select distinct D_ID, D_NAMA, BI_NAMA 
	from developer, game, DETAIL_GAME_BI, bahasa_interface
	where D_ID = Developer_D_ID
	and G_ID = Game_G_ID
	and BI_ID = bahasa_interface_BI_ID
	order by D_ID) as Dev_BI
group by D_ID
having count(*) > 1;


-- no 3
select User_U_ID, U_NAMA, bundle.BU_HARGA
from user, transaksi, Detail_Transaksi_Bundle, bundle
where TR_ID = transaksi_TR_ID
and Bundle_BU_ID = BU_ID
and U_ID = User_U_ID
and BU_HARGA = (select max(BU_HARGA) as harga_tertinggi
	from bundle inner join Detail_Transaksi_Bundle on BU_ID = Bundle_BU_ID)
order by U_ID;

-- no 4
select tahun, count(*) as jumlah_game_dirilis
from (select extract(year from game.G_TGLRILIS) as tahun, G_ID from game) as G_tahunRilis
group by tahun
order by tahun desc;

-- no 5
select T_ID, T_NAMA, round(avg(G_HARGA), 2) as Rata2_Harga_Game
from(select tags.T_ID, T_NAMA, game.G_HARGA
	from tags, detail_Game_Tags, game
	where T_ID = tags_T_ID
	and G_ID = Game_G_ID) as tags_game
group by T_ID;










