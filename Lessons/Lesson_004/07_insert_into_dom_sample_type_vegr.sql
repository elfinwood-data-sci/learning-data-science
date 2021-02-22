BEGIN;
INSERT INTO domains.dom_sample_type(sort_order, data_value, label, definition,note)
	VALUES (1,
			'vegr',
			'Vegetation Relevé Plot',
			'A relevé is a plot used to describe the plant species composition in a discrete plant community. All plant taxa occurring in the plot area are listed along with their respective foliar cover. Foliar cover is recorded using ocular cover estimates. Data describing the general environment and soils are also collected at each plot. Plots are typically circular with a 10 meter radius. However, the plot dimensions can be adjusted as needed to fit within a plant community or to meet the needs of a particular study.',
			'The relevé method of sampling vegetation was developed in Europe and was largely standardized by the Swiss ecologist Josias Braun-Blanquet.'
			)
RETURNING *;