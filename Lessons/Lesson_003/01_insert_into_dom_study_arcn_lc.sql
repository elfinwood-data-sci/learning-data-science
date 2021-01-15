BEGIN; /*Initiates a transaction block, all statements following this line will be executed until 
			a COMMIT (i.e., save) or ROLLBACK (i.e., abort) command is provided.*/
INSERT INTO domains.dom_study (
				  sort_order, 
				  data_value, 
				  label, 
				  definition, 
				  study_start_date, 
				  study_end_date, 
				  note
				 )
		VALUES (
				1,
				'arcn_lc',
				'U.S. National Park Service Arctic Network Land Cover Mapping',
				'This project was an eight-year effort (2002–2009) by ABR,Inc.–Environmental Research & Services to survey, compile, analyze, and map ecosystems across the five parks of the Arctic Network in Alaska, including Gates of the Arctic National Park and Preserve (GAAR), Noatak National Preserve (NOAT), Kobuk Valley National Park (KOVA), Cape Krusenstern National Monument (CAKR), and Bering Land Bridge Park and Preserve (BELA).',
				'2002-01-01',
				'2008-12-31',
				'The complete dataset and technical report are publicly available here: https://irma.nps.gov/Portal/'
		   	)
RETURNING *; /*shows the results of the above transaction block before the changes are committed, 
             		i.e., a way to check your work before saving*/
--ROLLBACK --aborts the transaction, changes are not saved to the database
--COMMIT --saves the changes to the database