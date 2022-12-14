use GameMarket_FP_kel6;

SELECT gm.G_NAMA, gm.G_HARGA
FROM developer dv left join game gm on dv.D_ID = gm.Developer_D_ID
where dv.D_NAMA = "Ubisoft"
order by gm.G_Harga asc
limit 1;

Select dlc.DLC_NAMA, count(dtd.transaksi_tr_id)*dlc.dlc_harga as jumlah_penghasilan
from detail_transaksi_dlc dtd inner join dlc on dtd.dlc_dlc_id = dlc.dlc_id
group by dlc.dlc_id
order by jumlah_penghasilan desc
limit 1;

select t.t_nama, count(dgt_g_dlc.dlc_id) as jumlah_dlc
from tags t left join(select dgt_g.tags_t_id, dgt_g.g_id, dlc.dlc_id 
from(select g.g_id, dgt.tags_t_id  from detail_game_tags dgt inner join game g on dgt.game_g_id = g.g_id)
 dgt_g inner join dlc on dgt_g.g_id = dlc.game_g_id) dgt_g_dlc on t.t_id = dgt_g_dlc.tags_t_id
group by t.t_id
order by t.t_id asc;

select user.u_nama, sum(dug_g.g_harga) as value_game
from user left join (select dug.user_u_id, g.g_id, g.g_harga 
from detail_user_game dug inner join game g on dug.game_g_id = g.g_id) dug_g
on user.u_id = dug_g.user_u_id
group by user.u_id
order by user.u_id asc;

select o.o_nama as NAMA_OS , count(dgo.game_g_id) as jumlah_game
from os o left join detail_game_os dgo on o.o_id = dgo.os_o_id
group by o.o_id
order by jumlah_game asc
limit 2;
