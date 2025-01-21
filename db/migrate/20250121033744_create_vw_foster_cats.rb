class CreateVwFosterCats < ActiveRecord::Migration[8.0]
  def up
    execute <<-SQL
      CREATE VIEW vw_foster_cats AS
      SELECT
        fc.id,
        fc.name,
        asr.sex,
        cb.breed,
        fc.birth_date,
        STRING_AGG(cc.color, ',') AS colors
      FROM
        foster_cats fc
      JOIN animal_sexes asr ON fc.sex_id = asr.id
      JOIN cat_breeds cb ON fc.breed_id = cb.id
      JOIN foster_cat_colors fcc ON fc.id = fcc.cat_id
      JOIN cat_colors AS cc ON fcc.color_id = cc.id
      GROUP BY fc.id, fc.name, asr.sex, cb.breed, fc.birth_date;
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW IF EXISTS vw_foster_cats;
    SQL
  end
end
