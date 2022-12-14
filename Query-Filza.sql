
use GameMarket_FP_kel6;

-- 1. Menampilkan user beserta game yang dimilikinya, berdasarkan game keluaran tahun 2021 keatas.
SELECT user.U_NAMA, ownedGames.G_Nama
FROM user cross join (
	SELECT detail_user_game.USER_U_ID, game.G_Nama
	FROM detail_user_game cross join game
	ON detail_user_game.GAME_G_ID = game.G_ID 
	AND EXTRACT(YEAR FROM game.G_TGLRILIS) >= 2021
	ORDER BY USER_U_ID
) as ownedGames
ON user.U_ID = ownedGames.USER_U_ID;

-- 2. Menampilkan user dan pengeluarannya dalam transaksi DLC dari Game Pamali
SELECT user.U_Nama, user_pengeluaran.TotalPengeluaranDLCPamali
FROM user cross join (
	-- cari id user apa yang membeli dlc pamali
	SELECT transaksi.USER_U_ID, SUM(trid_pengeluaran.TotalPengeluaranDLCPamali) 'TotalPengeluaranDLCPamali'
	FROM transaksi cross join (
		-- cari id transaksi mana yang membeli dlc Pamali
		SELECT detail_transaksi_dlc.TRANSAKSI_TR_ID, SUM(dlc_pamali.DLC_HARGA) 'TotalPengeluaranDLCPamali'
		FROM detail_transaksi_dlc cross join (
			-- cari id dlc pamali dan detil harganya
			SELECT dlc.DLC_ID, dlc.DLC_NAMA, dlc.DLC_HARGA
			FROM game cross join dlc
			ON game.G_ID = dlc.GAME_G_ID
			WHERE game.G_NAMA = "Pamali"
		) as dlc_pamali
		ON detail_transaksi_dlc.DLC_DLC_ID = dlc_pamali.DLC_ID
		GROUP BY TRANSAKSI_TR_ID
	) as trid_pengeluaran
	ON transaksi.TR_ID = trid_pengeluaran.TRANSAKSI_TR_ID
	GROUP BY USER_U_ID
) as user_pengeluaran
ON user.U_ID = user_pengeluaran.USER_U_ID;

-- 3. Menampilkan nama game yang memiliki bahasa audio vietnam ataupun thailand, Diurut berdasarkan nama game-nya.
SELECT game.G_NAMA, final.BA_NAMA 'Bahasa'
FROM game cross join (
	-- cari ID Game yang memiliki bahasa audio vietnam ataupun thailand
	SELECT detail_game_ba.GAME_G_ID, bahasa_spesifik.BA_NAMA
	FROM detail_game_ba cross join (
		-- cari ID Bahasa yang bernama Vietnam ATAU Thailand
		SELECT ba.BA_ID, ba.BA_NAMA
		FROM Bahasa_Audio ba
		WHERE ba.BA_NAMA = "Vietnamese" OR ba.BA_NAMA = "Thai"
	) as bahasa_spesifik
	ON detail_game_ba.Bahasa_Audio_BA_ID = bahasa_spesifik.BA_ID
) as final
ON game.G_ID = final.GAME_G_ID
ORDER BY game.G_NAMA;

-- 4. Menampilkan nama game yang tidak memiliki tags "shooter"
SELECT game.G_ID, game.G_NAMA
FROM game
WHERE game.G_ID NOT IN (
	-- cari ID Game yang memiliki tags "Shooter"
	SELECT DISTINCT detail_game_tags.GAME_G_ID
	FROM detail_game_tags 
	WHERE detail_game_tags.TAGS_T_ID IN (
		-- cari ID Tag yang merupakan "Shooter"
		SELECT Tags.T_ID
		FROM Tags
		WHERE Tags.T_Nama = "Shooter"
	)
)
ORDER BY game.G_ID;

-- 5. Menampilkan persentase dari game yang memiliki age-rating "PEGI-18"
SELECT ROUND(COUNT(game.G_AGERATING) / (
	SELECT COUNT(game.G_ID)
	FROM game
) * 100, 1) as 'Game PEGI-18 (%)'
FROM game
WHERE game.G_AGERATING = "PEGI-18";


