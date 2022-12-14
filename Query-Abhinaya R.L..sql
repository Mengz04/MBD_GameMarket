-- no 1
select o.O_NAMA, g.G_NAMA
from Game g, os o, DETAIL_GAME_OS dgs
where dgs.OS_O_ID = o.O_ID
and g.G_ID = dgs.Game_G_ID
order by O_NAMA;

-- no 2
select u_nama, format (sum(g_harga + dlc_harga + b_harga)) as Total_Pengeluaran
from user, transaksi, game, dlc, bundle
where u_id = user_id in (
	select tr_id
    from detail_transaksi_game dtg, detail_transaksi_dlc dtd, detail_transaksi_bundle dtb
    where tr_id = dtg.transaksi_tr_id
    and tr_id = dtd.transaksi_tr_id
	and tr_id = dtb.transaksi_tr_id
)
group by u_nama
order by u_nama;

-- no 3
select t.T_NAMA, count(t.T_NAMA) as jumlah_peminat
from Tags t, User u, detail_user_game dug, game g, detail_game_tags dgt
where g.G_ID in (
	select g.G_ID
	where dug.GAME_G_ID = g.G_ID
    and dug.User_U_ID = u.U_ID
)
and g.G_ID = dgt.GAME_G_ID
and t.T_ID = dgt.TAGS_T_ID
group by t.T_NAMA
order by jumlah_peminat desc;

select u.U_ID, count(g.G_ID) as banyak_game
from User u, game g, detail_user_game dug
where dug.GAME_G_ID = g.G_ID
and dug.User_U_ID = u.U_ID
group by U_ID
order by banyak_game desc;

select dug.User_U_ID, count(dug.GAME_G_ID) as banyak_game
from detail_user_game dug
group by dug.User_U_ID
order by banyak_game desc;

select dgt.TAGS_T_ID, count(dgt.GAME_G_ID) as banyak_game
from detail_game_tags dgt
group by dgt.TAGS_T_ID
order by banyak_game desc;

-- no 4
select g.G_ID , g.G_NAMA, avg(d.DLC_HARGA) as harga_rata2_dlc
from game g, dlc d
where g.G_ID = d.GAME_G_ID
group by g.G_ID
order by g.G_ID;

-- no 5
select tr.TR_METODEBAYAR, count(u.U_ID) as banyak_user
from transaksi tr, user u
where u.U_ID = tr.USER_U_ID
group by tr.TR_METODEBAYAR;
