BEGIN TRANSACTION;
DROP TABLE IF EXISTS meal_recipe;
DROP TABLE IF EXISTS user_recipe;
DROP TABLE IF EXISTS user_plan;
DROP TABLE IF EXISTS meal_plan;
DROP TABLE IF EXISTS meals;
DROP TABLE IF EXISTS plans;
DROP TABLE IF EXISTS recipes;



DROP SEQUENCE IF EXISTS seq_recipe_id;

CREATE SEQUENCE seq_recipe_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE;

CREATE TABLE recipes (
	recipe_id int DEFAULT nextval('seq_recipe_id'::regclass) NOT NULL,
	recipe_name varchar (75)  UNIQUE NOT NULL,
	ingredients varchar (2000) NOT NULL,
	directions varchar (3000) NOT NULL,
	calories int,
	is_low_fat boolean, 
	is_high_protein boolean,
	is_low_carb boolean,
	is_low_sodium boolean,
	is_breakfast boolean,
	is_lunch boolean,
	is_dinner boolean,
	img varchar (1000),
	CONSTRAINT pk_recipe_id PRIMARY KEY (recipe_id)
	);

DROP SEQUENCE IF EXISTS seq_meal_id;

CREATE SEQUENCE seq_meal_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE;

CREATE TABLE meals(
	meal_id int DEFAULT nextval('seq_meal_id'::regclass) NOT NULL,
	type_of_meal varchar(20),
	day_of_week varchar(10) NOT NULL,
	CONSTRAINT pk_meal_id PRIMARY KEY (meal_id)
	);
	
	

DROP SEQUENCE IF EXISTS seq_plan_id;

CREATE SEQUENCE seq_plan_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE;
  
CREATE TABLE plans(
	plan_id int DEFAULT nextval('seq_meal_id'::regclass) NOT NULL,
	plan_name varchar (100),
	CONSTRAINT pk_plan_id PRIMARY KEY (plan_id)
	);
	

CREATE TABLE meal_plan (
	meal_id int NOT NULL,
	plan_id int NOT NULL,
	CONSTRAINT fk_meal_id FOREIGN KEY (meal_id) REFERENCES meals(meal_id),
	CONSTRAINT fk_plan_id FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
	);
	

CREATE TABLE user_plan (
	user_id int NOT NULL,
	plan_id int NOT NULL,
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT fk_plan_id FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
	);
	

CREATE TABLE user_recipe (
	user_id int NOT NULL,
	recipe_id int NOT NULL,
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id)
	);
	
CREATE TABLE meal_recipe (
	meal_id int NOT NULL,
	recipe_id int NOT NULL,
	CONSTRAINT fk_meal_id FOREIGN KEY (meal_id) REFERENCES meals(meal_id),
	CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id)
	);
	
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Chicken Vesuvio', 
		  '1/2 cup olive oil, 5 cloves garlic peeled, 2 large russet potatoes, peeled and cut into chunks, 1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs, 3/4 cup white wine, 3/4 cup chicken stock,  3 tablespoons chopped parsley, 1 tablespoon dried oregano, Salt and pepper, 1 cup frozen peas, thawed',
		  '1,Heat an oven to 325°F. In a roasting pan (or a large (14-inch) oven-proof skillet), heat the olive oil over medium until shimmering. Add the potatoes and garlic and cook until golden brown, about 12 minutes. Remove to a plate, leaving behind as much oil as possible. 2,Add the chicken to the skillet, skin-side down. Cook until golden and crisp, then turn and cook the other side until golden as well. Add the wine and cook until it reduces by half. 3,Return the garlic and potatoes to the pan, along with the chicken stock, parsley, oregano, and a pinch of salt and pepper. Transfer to the oven and cook, uncovered, until the chicken is cooked through, about 45 minutes. Add the peas to 
			the pan with 5 minutes left in the cooking time. Serve with the roasting juices in the pan.',
			1000, false, true, false, false, false, false, true, 'https://www.seriouseats.com/thmb/TYQEkM-okEXCCMwWFk3JvSchNoo=/880x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2011__12__20111215-dt-chicken-vesuvio-primary-e81c59ea0ba74ab38c6722b7802eb0f1.jpg');
			
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Peanut Butter and Jelly',
			'2 peices of bread, 2 tablespoons of jelly, 1.5 tablespoons of peanut butter ',
			 '1, spead penut butter on bread. 2, spread jelly on bread. 3, cut in half. 4, eat.',
			350, false, true, false, false, false, true, false, 'https://www.wholesomeyum.com/wp-content/uploads/2021/03/wholesomeyum-keto-peanut-butter-and-jelly-sandwich-3.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Sunny-Side up Eggs',
		   '1 tsp olive oil, 2 eggs',
		   '1, Pre-heat pan and oil over medium high heat. 2, Crack both eggs over the pan. 3, Cook 3 minutes, or until white is completely set. Remove from pan and season with salt and pepper.',
		   150, true, true, true, true, true, false, false, 'https://assets.bonappetit.com/photos/58c957546b9097760bea5082/master/w_1280,c_limit/olive-oil-basted-fried-eggs.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Roasted Chicken And Vegetables',
		   '4 free range organic chicken breasts, 2 1/2 cups big diced potatoes, 1 medium red bell pepper diced, 1 medium orange bell pepper diced, 1 medium green bell pepper diced, 1 small onion diced, 5 garlic cloves, 1 tbsp olive oil, Salt, Pepper',
		   '1, line your baking sheet with aluminum foil or parchment paper. 2, Chop up all of your veggies and arrange them in a single layer on your pan. Drizzle with oil and season with salt and pepper. Then, use a mixing spatula or large spoon to toss the veggies so they are evenly coated. 3, Toss the chicken breasts with oil and spices, then lay them on top of the veggies. Be sure there is plenty of space between each one. As a result, they will all cook evenly. 4, Bake for 20-25 minutes, or until chicken is cooked through. If you’re meal prepping, divide the chicken and vegetables into equal amounts and place into individual containers.',
			500, true, true, true, true, false, true, true, 'https://www.primaverakitchen.com/wp-content/uploads/2020/02/Mediterranean-Roasted-Chicken-Breast-Primavera-Kitchen-3-800x1200.jpg' );


INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner,img) 
	VALUES ('French Onion Soup',
			' 8 Onions, 4 tbsp Butter, 2 Colves Garlic, 7 Cups Beef Broth, 2 tsp Worcestershire Sauce, 2 tbsp Sherry, 2 Sprigs Thyme, 1/4 cup Parmesan Cheese, 4 oz. Provolone Cheese, 4 Slices French Bread',
			'1, Melt the butter in a large, heavy-bottom pan over medium-high heat. Add the onion, stirring to coat with butter. Cook onion until soft and caramelized, about 25 to 30 minutes. 2, Add the garlic and cook 1 minute, until fragrant. Add the sherry, stir and scrape bottom of pan for brown bits, and cook until sherry is evaporated. Now, add the beef broth, thyme and worcestershire sauce. 3,Bring to a simmer, cover and lower heat to maintain a low simmer. Cook for 30 minutes. Season to taste with salt and pepper. 4,  Ladle soup into oven-safe bowls. Top soup with 2 toasts, then 2 slices of provolone and a dusting of parmesan. Place bowls on a baking sheet and heat under the broiler until cheese is melted and bubbling.',
			360, false, false, false, false, false, true, true, 'https://www.mustlovehome.com/wp-content/uploads/2019/10/Classic-French-Onion-Soup-4-600x900.jpg');
			
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Overnight Oats',
			'1/3 cup old-fashioned oats, 1/4 teaspoon ground cinnamon, 1 tbsp chia seeds, 1 tbsp almond butter, 1/2 cup milk of choice, 1/2 cup fruit',
			'1, In a jar or bowl combine old-fashioned oats and cinnamon, chia seeds and nut butter. Add the milk and mix the nut butter into the oats. 2, Top with your fruit of choice. If you used more milk than 1/2 cup and you want your fruit to stay on top, wait to top the oats. 3, Place the lid on the jar and refrigerate overnight.',
			240, true, true, false, true, true, true, false, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-p_0xkiye_670anaFW_mZFf-XkbjddPl2-g&usqp=CAU');
			
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Garlic Parmesan Zucchini Noodles Pasta',
			'4 medium zucchini, 3 tablespoons extra virgin olive oil, 1 tablespoon minced garlic, 1/4 to 1/2 teaspoon crushed red pepper flakes, depending on how spicy you like the pasta, 2 medium chopped tomatoes, 1/2 cup shredded parmesan cheese, 1 cup basil leaves, torn into pieces, 1 teaspoon cornstarch, 2 teaspoons cold water, Salt, to taste',
			'1, Trim and spiralize the zucchini. 2, Add olive oil, garlic, and the red pepper flakes to a large, deep skillet. Turn to medium heat. When the oil begins to bubble around the garlic, add the zucchini noodles 5 yo 7 minutes. 3, Stir in the tomatoes, basil, and parmesan cheese. Cook for one minute. Use pasta tongs to transfer the noodles, tomatoes, and basil to a serving dish. Leave the liquid in the skillet. 4,Bring the liquid left in the skillet to a simmer and combine cornstarch and cold water in a small bowl then whisk into the simmering liquid. Cook, while whisking until the liquid thickens to a sauce; about 1 minute. 5, Taste the sauce and season with salt. Pour the sauce over the zucchini, tomatoes, and basil. Finish with more parmesan cheese on top',
			200, true, false, true, false, false, true, true, 'https://www.inspiredtaste.net/wp-content/uploads/2016/08/Zucchini-Pasta-Recipe-1.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Egg Omelette',
			'2 large eggs, 1 tablespoon unsalted butter, 2 tablespoons grated cheese,  3 to 4 cherry tomatoes, 2 tablespoons chopped basil ',
			'1, Beat the eggs. 2, Melt the butter. 3, Add the eggs. 4, Fill the omelette. 5, Fold and serve.',
			340, false, true, true, true, true,true, false, 'https://www.simplyrecipes.com/thmb/gZF2-5xBQOjQD8ToXjmUbtLbQJo=/720x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2018__10__HT-Make-an-Omelet-LEAD-HORIZONTAL-17cd2e469c4a4ccbbd1273a7cae6425c.jpg' );

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Turkey Sandwich',
			'2 slices of toasted bread, Sliced or pulled turkey, 1 tbsp crandberry sauce, 2 tbsp mayo or garlic aoli, 2 oz mozzarella or provalone ',
			'1, Lightly toast the bread. 2, Spread 2 of the slices with mayonnaise. 3, Top with cheese, turkey, lettuce, and tomatoes (optional). Season with salt & pepper if desired. 4, Spread remaining slices of bread with cranberry sauce and top sandwich. ',
			420, false, true, false, true, false, true, false, 'https://www.spendwithpennies.com/wp-content/uploads/2019/11/Turkey-Sandwich-SpendWithPennies-2.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Salmon With Roasted Veggies',
			'1 8oz Salmon filet, 1 head of brocolli, 1 diced potatoes, onion diced, garlic minced, 1 red pepper diced',
			'1, preheat oven to 400F. 2, toss chopped veggies in olive oil, salt, pepper, oregano, smoked paprika, tyme, rosemarry, and any other seasonings you like. 3, place the pan of veggies and slmon on a seporate plan in oven and bake until salmon reaches 130F internal temp, stir veggies occasionally. ',
			475, true, true, true, true, false, false, true, 'https://images-gmi-pmc.edge-generalmills.com/5cdc7032-ca50-4b1d-9210-72d992e5a71f.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Mediterranean Chickpea Salad',
			'1 can of chickpeas,1 medium cucumber, chopped, 1 bell pepper, chopped, 1/2 red onion, thinly sliced, 1/2 c. chopped kalamata olives, 1/2 c. crumbled feta, Lemon Parsley Vinaigrette ',
			'1, In a large bowl, toss together chickpeas, cucumber, bell pepper, red onion, olives, and feta. Season with salt and pepper. 2In a jar fitted with a lid, combine olive oil, vinegar, lemon juice, parsley, and red pepper flakes. Close the jar and shake until emulsified. 3,Dress salad with vinaigrette just before serving. ',
			360, false, true, true, true, false, true, true, 'https://hips.hearstapps.com/vidthumb/images/mediterranean-chickpea-salad-1526077481.png?crop=1xw:1xh;center,top&resize=768:*');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Turkey Burger',
			'Ground turkey, garlic, tomato, red onion, egg, mayo, potatoe buns, lettuce',
			'1, Mix ground turkey with egg and spices. 2, grill buns and burger till done, 3, assemble burger ',
			460, true, false, false, false, false ,true, true, 'https://www.killingthyme.net/wp-content/uploads/2021/11/best-turkey-burger-recipe-5-720x458.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES (' Stuffed Poblano Peppers ',
			'Poblano peppers, Ground beef, garlic, chili powder, cumin, paprika, red pepper, red onion, Cheddar cheese, cilantro, Pico de gallo',
			'1, Cut peppers in hal and de-seed, 2,Cook ground beef over med-high heat until browned and drain any excess fat. 3,Add chili powder, cumin, paprika, salt, garlic, red pepper and red onion, sauteeing another 2 minutes until veggies are tender. 4, Stuff ground beef mixture into poblano peppers and top with cheese. Bake again until cheese is melted. 5, Remove from oven and add toppings of choice. ',
			490, true,true, false, false, false, true, true, 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/11/20/5/QFSP02_Alexs-Vegetarian-Stuffed-and-Baked-Poblano_s4x3.jpg.rend.hgtvcom.616.462.suffix/1449096346133.jpeg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Waffle with Cream Cheese and Smashed Berries recipes',
			'1 waffle, 2 tablespoons cream cheese, 2 tablespoons rasberries/blueberries/blackberries, 1 tablespoon honey or agave',
		   'Toast a waffle and smear with cream cheese. Using a fork, smash raspberries, blueberries, or blackberries on top of cream cheese. Drizzle with honey or agave.',
		   390, false, false, false, true, true, false, false, 'https://www.edamam.com/food-img/f35/f350a14e0e625e77a2a5031703a402e2.jpg');
		   
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Mediterranean Chicken Wrap',
		  '1 chicken cutlet, coarse salt, ground pepper, 1 whole-wheat wrap, 1 tablespoon olive tapenade, 2 canned artichoke hearts, 1/2 small tomato, 1/4 cup mixed baby greens',
		  'Heat broiler with rack 4 inches from heat. Season chicken with salt and pepper and broil until opaque throughout, 4 to 5 minutes; let cool. Spread bottom of wrap with the olive tapenade. Layer with chicken, artichoke hearts, tomato, and baby greens; season with salt and pepper. Fold tortilla to seal.',
		  325, true, true, false, true, false, true, true, 'https://res.cloudinary.com/hksqkdlah/image/upload/10938_sfs-mediterranean-chicken-wraps-016.jpg');
		  
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Spaghetti Genovese',
		  '200g trimmed green beans, olive oil, 120g fresh pesto, 300g spaghetti, 300g potatoes',
		  'Pour a kettle of boiling water into a very large pan until half full. Return to the boil, then add the potatoes and spaghetti, and a little salt. Cook for 10 minutes until the potatoes and pasta are almost tender. Tip in the green beans and cook for 5 minutes more. Drain well, reserving 4 tbsp of the cooking liquid. Return the potatoes, pasta and beans to the pan, then stir in the fresh pesto and reserved cooking liquid. Season to taste, divide between four serving plates and drizzle with a little olive oil.',
		  1915, false, false, false, true, false, true, true,'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-1845_10-e6b81e8.jpg');
		  
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Bacon with Citrus Glaze recipes',
		  '8 slices of slab bacon, 2 navel oranges, 1 tablespoon cane syrup',
		  'Preheat oven to 400 degrees. Lay bacon on a baking sheet. Juice oranges into a small saucepan, and add cane syrup. Cookover medium heat until glaze is thick enough to coat theback of a spoon, about 8 minutes. Brush some glaze over the bacon, and bake for 10 minutes.Brush with more glaze. Continue to bake until golden,about 15 minutes more (10 minutes if using regular bacon).Brush bacon with remaining glaze, and transfer to a parchment-or paper-towel-lined plate to drain before serving.',
		  311, false, true, true, true, true, true, false, 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fassets.marthastewart.com%2Fstyles%2Fwmax-750%2Fd31%2Fessentialemeril-bacon-mrkt-0915%2Fessentialemeril-bacon-mrkt-0915_horiz.jpg%3Fitok%3DwVw7DSKE&w=272&h=272&c=sc&poi=face&q=60');
		  
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Turkey Soup',
		  '1 Turkey, 2 1/2 cups turkey stuffing, 2 cups turkey gravy, 3 carrots, 3 ribs of celery, 1 onion, 1/2 cup fresh parsley, 1 bay leaf, 2 tsp. dried thyme, salt',
		  'Put all the ingredients with 10 cups the water into a large soup pot over medium heat, bring to a boil, and then reduce the heat to a simmer. Stir to break up all the clumps of stuffing and mix well. Let the soup simmer for about 1 1/2 hours. Add another 1 1/2 cups of cold water and let simmer for 10 more minutes. Taste for salt and adjust the flavoring if necessary. Serve hot.',
		  840, true, true, true, false, false, true, true, 'https://dinnerthendessert.com/wp-content/uploads/2019/11/Turkey-Soup-4.jpg');
		  
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('The Ultimate Burger',
		  '2 1/2 pounds skirt steak, burger buns, ketchup, mustard, pickle relish, lettuce, tomato',
		  'Cut steak into 1 1/2-inch pieces and season with 11/2 teaspoon salt. Chill in a sealable bag 4 to 6 hours. Rinse steak under cold water, then pat dry. Grind using a meat grinder with a 3/8-or 1/4-inch die or finely chop in a food processor. Form into 6 balls and flatten into patties about 1 inch thick and 4 inches in diameter. Chill until ready to grill. Prepare grill for direct-heat cooking over medium-hot charcoal (medium-high heat for gas) Season burgers with 1/4 teaspoon pepper (total). Lightly oil grill rack. Grill burgers, covered only if using a gas grill, turning once, about 5 minutes total for rare or 6 minutes for medium-rare. (Burgers will continue to cook slightly once removed from grill.',
		  650,false,true,false,false,false,true,true,'https://assets.epicurious.com/photos/5609a5a06a59cdb91b5ff550/master/w_1280,c_limit/353654_hires.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Banana Oatmeal Pancakes',
		   '3 small bananas very ripe, 2 tablespoons meltedbutter or coconut oil, 1 tablespoon lemon juice, 2 eggs,1 cup rolled oats,1/2 teaspoon salt,1/2 teaspoon baking soda, 1/2 teaspoon cinnamon, 1/4 teaspoon nutmeg',
		   'Place oats in a blender or food processor and pulse until they are ground into a fine meal or flour-like consistency. In a large bowl, using a fork, mash the bananas until well combined. Add melted butter or coconut oil, lemon juice and eggs, and whisk until well combined. Add ground oats, salt, baking soda, cinnamon and nutmeg and mix until well combined. Once mixed, allow the batter to sit for at least 10 minutes. Depending on the size of your bananas, you may need to thin out the batter a bit with a splash of milk. Heat a griddle or pan to medium heat, add a knob of butter, and then pour 1/4 cup of batter onto the pan. Allow to cook for about 3 minutes or until bubbles begin to form on the surface, then carefully flip with a spatula and cook for another 1-2 minutes or until golden. Serve pancakes immediately or keep warm in the oven at 200°F until ready to serve.',
			116, true, false, false, true, true, false ,false, 'https://kaynutrition.com/wp-content/uploads/2021/03/banana-oatmeal-pancakes-150x150.jpg');	
		   
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Avocado Tomatillo Breakfast Tacos',
		   '5 cups spinach, 3 eggs, EVOO, 4 tortillas, 1/2 sliced avacado, roasted tomatoes, serano peppers',
		   'Brush a medium nonstick stick skillet lightly with olive oil and bring to medium heat. Add the spinach and pinches of salt and pepper and sauté until the spinach is wilted. Work in batches, if necessary.
Wipe out the skillet and scramble the eggs. Brush the skillet lightly with olive oil and bring to medium heat. Add the eggs, let them cook for a few seconds, and then stir and scramble the eggs until just set.
Assemble the tacos with the eggs, spinach, avocado slices, and scoops of tomatillo salsa. Top with the microgreens and sliced serranos and serve with lime wedges, if desired.',
		   350, false, false, true, true, true, true, false,'https://cdn.loveandlemons.com/wp-content/uploads/2018/09/IMG_13763-cropped2-580x580.jpg');
		   
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Slow-Roasted Salmon With Harissa',
		   '⅓ cup extra-virgin olive oil, ¼ cup harissa paste, 1 garlic clove, grated, 1 lemon halved, 1 (2-lb.) skinless center-cut salmon fillet, Kosher salt, Mixed tender herbs',
			'Preheat oven to 275°F. Whisk oil, harissa, and garlic in a medium bowl. Pour half of harissa oil into a 2.5-qt. baking dish and swirl to coat. Thinly slice a lemon half and remove any seeds; scatter slices in dish. Season salmon on all sides with salt and place in dish. Pour remaining harissa oil over salmon, spreading evenly over flesh with a pastry brush or spoon. Roast 15 minutes. Remove from oven and baste fish with harissa oil pooled in dish. Return to oven and continue to roast until flesh flakes apart easily with a spoon but is not quite cooked through, 10–20 minutes longer. Use spoon to break up salmon into irregular pieces. Arrange salmon and lemon slices on a platter. Drizzle with any harissa oil left in dish, squeeze remaining lemon half over, and scatter some herbs around.',
			300, false, true, false, false,false, true, true, 'https://assets.epicurious.com/photos/5ac271923e01605efd1b46b9/1:1/w_1920,c_limit/slow-roasted-salmon-with-harissa-recipe-BA-032918.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Thai Basil Chicken (Pad Krapow Gai)',
		   '1.5 lbs ground chicken, 1.5 cup basil, 12-13 cloves garlic, 7-8 red bird chilis, 3 Tbsp soy sauce, 3 Tbsp oyster sauce, 1 Tbsp fish sauce, 1 tsp sugar, 3 Tbsp vegetable oil, 4 eggs',
			'Crush chilis and peeled garlic into a paste. Heat oil in wok over high heat. Add chili-garlic paste and stir for 20 seconds. Add chicken, stir continuously 6-8 minutes, or until chicken is thoroughly cooked. Add sugar and sauces, stir until well mixed. Fold in basil. Remove from heat immediately, so the basil doesnt overcook. Fill frying pan with 1/4 inch of oil. Get nice and hot. Drop in eggs. Fry until edges are nice and crispy, spooning hot oil over eggs to cook the top. Cook until desired doneness. Serve your Thai Basil Chicken over hot cooked rice and top with egg. Enjoy!',
			500, false , true, false, false, false, true, true, 'https://gypsyplate.com/wp-content/uploads/2021/03/pad-krapow-gai_square02-480x480.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Honey Garlic Shrimp',
		   '2 large oranges, 1 tablespoon honey, 2 tablespoons reduced or gluten-free sodium soy sauce, 1 tablespoon unseasoned rice vinegar, 1 tablespoon cornstarch, 32 jumbo shrimp, peeled and deveined (18 ounces total), 1/4 teaspoon Kosher salt, freshly ground black pepper, 1 tablespoon canola oil, divided, 6 cloves garlic, minced, 1 tablespoon finely minced fresh ginger, 2 scallions, whites thinly sliced, greens cut into 2-inch lengths, 1/4 to 1/2 teaspoon red pepper flakes, Cooked rice, for serving'
			,'Finely grate the zest from 1 orange, about 2 teaspoons. Juice both oranges into a bowl (you should have about 3/4 cup). Whisk in the honey, soy sauce, and vinegar with 1 tablespoon of water. In a small bowl, combine the cornstarch with 1 tablespoon of the orange-soy mixture to form a paste, then stir that back into the bowl with the rest of the orange-soy mixture. Pat the shrimp dry with paper towels and season both sides with salt and pepper. In the largest skillet (or wok) you have, heat 1 teaspoon of the oil over medium high heat until shimmering-hot, almost smoking. Add half of the shrimp, spread it out in one layer, and cook until the underside is bright pink, 1 to 1½ minutes. Flip and cook 1 minute more, then transfer the shrimp to a plate. Repeat with another 1 teaspoon oil and shrimp. Set aside. Add the remaining teaspoon of oil to the skillet. Add the garlic, ginger, scallion whites, and red pepper flakes and cook until fragrant, 30 seconds to 1 minute. Add the orange-soy liquid and the orange zest and cook, stirring, until thickened, 1 to 2 minutes. Return the shrimp to the skillet, add the scallion greens, and toss to coat with the sauce. Divide the shrimp among 4 bowls and serve with rice.',
			180, true, true, true, false, false, true, true, 'https://www.skinnytaste.com/wp-content/uploads/2019/02/HONEY-GARLIC-SHRIMP-6.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Greek Chicken Kabobs with Tzatziki Sauce',
		   '1/4 cup olive oil, 1/4 cup lemon juice, Zest of 1 lemon, 1 Tbsp red wine vinegar, 4 cloves garlic, minced, 1 tsp honey, 1/2 tsp salt, 1/4 tsp freshly ground black pepper, 2 Tbsp fresh oregano (or 2 tsp dried), 1 Tbsp fresh parsley, 1 1/4 lb boneless skinless chicken breasts, 1 medium zucchini, 1 pint cherry or grape tomatoes, 1 white onion, cut into large chunks, 1/2 cup plain Greek yogurt, 1/2 cup grated cucumber, 1 Tbsp lemon juice, 1 Tbsp olive oil, 2 cloves garlic, minced, 1 Tbsp fresh dill, chopped, 2 tsp fresh parsley, chopped, 1/4 tsp salt + pinch of pepper',
			'Place chicken in a large bowl or ziplock bag. To make the marinade, whisk together all the ingredients until combined. Reserve a couple tablespoons  of the marinade and pour the rest over top of chicken until completely coated. Seal the bag or cover and marinate chicken in the fridge for at least 30 minutes or up to 4 hours. Pre-heat grill on medium-high heat, making sure to lightly spray with oil to avoid sticking.  If using wooden skewers, make sure to soak them in cold water for 15 to 20 minutes to prevent them from burning on the grill. To assemble the kabobs, first layer on an onion slice, followed by some chicken, a zucchini slice, then a cherry tomato.  Then just repeat these layers until you get to the end of the skewer and discard the marinade used for the chicken.  Place the skewers on the grill and cook them about 5 to 6 minutes on each side, brushing with the reserved marinade until the chicken is cooked through.  The internal temp should read 165 degrees F. To make the tzatziki sauce, mix together the yogurt, grated cucumber (make sure to squeeze out all the water so the dip doesn’t get watery), lemon juice, olive oil, garlic and fresh herbs.  I also like to season with salt/pepper and top with fresh dill. Serve the kabobs with tzatziki sauce and enjoy!',
			337, true, true,true,false, false, true,true, 'https://www.eatyourselfskinny.com/wp-content/uploads/2020/07/greek-chicken-5-320x320.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Shrimp with summer veggies',
		   '1lbs shrimp, 1 zuccini, 1 squash, 1 onion, 3 cloves garlic, grape tomatoes, 1/2 lb orzo, chilli oil, lemon',
		   'Boil water and season with salt then add orzo. Chop all veggies, onion, galic and place into preheated pan with olive oil. then, add seasonings to pan. In a seporate pan sear the shrimp on both sides. When orzo is finished drain it and squeeze 1/2 a lemon over it. Combine orzo and veggies. plate the vegatable/ orzo mixture and plae shrimp on top. drizzle chili oil on top',
		   380, true,true,true,true, false, true,true,'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fassets.marthastewart.com%2Fstyles%2Fwmax-750%2Fd21%2Fshrimp-orzo-med108373%2Fshrimp-orzo-med108373_horiz.jpg%3Fitok%3D_JgejBNo');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Baked Red Snapper Recipe',
		   '1 pound snapper filets, 1 tablespoon extra virgin olive oil, 1 tablespoon lemon juice, 3 cloves garlic, grated, 1/2 teaspoon fine sea salt, 1/4 teaspoon ground black pepper, 1 lemon, cut into wedges',
		   'Preheat the oven to 375 F. Place the snapper filets in a baking dish or on a rimmed baking sheet, then rub on both sides with the olive oil, lemon juice, garlic, salt, and pepper. Place the lemons around the snapper, then transfer to the oven to bake for 20 minutes, until the snapper easily flakes with a fork. Let cool slightly, then squeeze the baked lemons over the snapper and serve!',
		   150, true, true, true, true, false, false, true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXZZ7gIX5HSLk7CEOVgAAKx7QT3vF5j8rm7A&usqp=CAU');
		   
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img)
	VALUES('Tuna Steaks',
		   '2 ahi tuna steaks, 2 tablespoons soy sauce, 1 tablespoon toasted sesame oil see notes, 1 tablespoon honey see notes, 1/2 teaspoon kosher salt, 1/4 teaspoon black pepper to taste, 1/4 teaspoon cayenne pepper (optional), 1 tablespoon canola oil or olive oil, green onions, toasted sesame seeds, and lime wedges',
		   'Pat the ahi tuna steaks dry with a paper towel. Place on a plate or inside a plastic bag Mix the soy sauce (2 tablespoons), toasted sesame oil (1 tablespoon), honey (1 tablespoon) kosher salt (1/2 teaspoon- OMIT if marinating for more than a couple hours, see notes), pepper (1/4 teaspoon), and cayenne pepper (1/4 teaspoon) until honey is fully dissolved. Pour over the ahi tuna steaks and turn over to coat completely. Optional: allow to marinate for at least 10 minutes, or up to overnight in the refrigerator. Heat a medium skillet (preferably non-stick or a well-seasoned cast iron skillet) on medium-high to high until very hot,Add the canola oil (1 tablespoon) to the hot pan. Sear the tuna for 1 - 1½ minutes on each side for medium rare ( 2 -2½ minutes for medium-well to well, 30 seconds for very rare. allow to rest for at least 3 minutes. Slice into 1/2 inch slices and serve garnished with green onions, toasted sesame seeds, and a squeeze of fresh lime juice, if desired. ',
		   330, true, true, true, true, false, false, true, 'https://www.bowlofdelicious.com/wp-content/uploads/2015/11/Ahi-Tuna-Steaks-1.jpg');
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Salmon Avocado Salad', '4 cups baby spinach, 2 tomatoes, 1 avocado, 1 cucumber, 1/4 cup red onion, 2 tablespoon olive oil, 2 salmon filets, salt and pepper, 1 recipe lemon vinaigrette', 
'Heat olive oil in a large pan over medium-high heat. Season the salmon filets with salt and pepper. Add the salmon filets top side down and cook for 4-5 minutes.
Flip the salmon and cook for an additional 2-3 minutes or until the salmon is mostly opaque, with just a smidge of softness still in the middle.
Divide all of the other salad ingredients between two bowls, then place the cooked salmon on top.
Mix the dressing ingredients together in a small bowl and drizzle on top.', 293, false, true, true, false, false, true, true, 'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2020/07/Salmon-Avocado-Salad-5-1.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Healthy General Tso s Chicken', '2 tsp cornstarch, 1/4 tsp salt, 1/8 tsp ground white pepper, 2 boneless chicken breasts, 1/4 cup tomato ketchup, 2 Tbsp rice vinegar, 4 tsp hoisin sauce, 4 tsp brown sugar, 4 tsp soy sauce, 2 Tbsp peanut oil, 1 dried red chile, 1 tsp toasted sesame seeds, 1 scallion','In a small bowl, mix the cornstarch, salt, and white pepper. Sprinkle over the sliced chicken, tossing to coat, and let marinate at room temperature for 20 minutes. Meanwhile, in a separate bowl, make the sauce by combining the ketchup, rice vinegar, hoisin sauce, brown sugar, and soy sauce, and mix it well. Set the sauce aside. In a wok over medium-high heat, heat the peanut oil. Add the chicken and stir-fry in batches until fully cooked and slightly brown. Add the chile and pour in the sauce. Stir to coat the chicken in the sauce. Turn off the heat and transfer the dish to a serving plate. Garnish with the sesame seeds and chopped scallion.',
			207, false, true, false, false, false, true, true, 'https://platedcravings.com/wp-content/uploads/2017/05/General-Tsos-Chicken-Plated-Cravings-4-640x853.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Chicken Lettuce Wraps', '1 tablespoon olive oil, 1 pound ground chicken, Salt and pepper to taste, 1 Tbs minced garlic, 1/2 cup yellow onion diced, 1/4 cup hoisin sauce, 2 TBS oyster sauce, 2 TBS soy sauce, 1 TBS rice wine vinegar, 1 tsp ginger paste, 1 Tsp red chili paste, 1 8- ounce can whole water chestnuts, 2 green onions, 1 head butter lettuce','Heat olive oil in a large skillet over medium-high heat.Add ground chicken and season with salt and pepper, or chunked up chicken breasts. Brown and crumble chicken, about 3-5 minutes, drain fat. Or cook chicken breast chunks, drain fat. After draining, return to heat and stir in garlic, onion, hoisin sauce, oyster sauce, soy sauce, rice wine vinegar, ginger, and chili paste and cook until onions have become translucent, about 2-3 minutes.Stir in chestnuts and green onions cooking until tender, about 1-2 minutes; Taste and season with salt and pepper, to preference. Spoon several tablespoons of the chicken mixture into the center of a lettuce leaf 
	and enjoy', 293, false, true, true, false, false, true, true, 'https://www.eazypeazymealz.com/wp-content/uploads/2016/06/Chicken-Lettuce-wraps-6.jpg');


INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Go-To Quinoa Salad', 'Dry quinoa, Parsley, Tomatoes, English cucumber, Red bell pepper, Tuscan kale, Green onions, Salt and dried basil, Dijon mustard, honey, red wine vinegar, olive oil, Feta crumbles',
	'Use our optimized water ratio for fluffy grains. Most recipes for quinoa suggest a ratio of 1 cup quinoa to 2 cups water, but can come out soggy. After extensive testing, we’ve developed a new quinoa to water ratio: try 1 cup quinoa to 1 ¾ cups water. Simmer it up, and it makes for fluffy grains that aren’t waterlogged.
Cool before using in the salad: here’s a trick! You can’t use dump the freshly cooked grain right in the salad: it’s too hot and moist. Instead, we’ve got a trick: place it in a single layer on a baking sheet, then pop it in the freezer for 2 to 3 minutes. Then you can use the room temperature quinoa right away!
Or, make the quinoa in advance. If you like, you can make the quinoa up to 1 day in advance and refrigerate until serving: then you can skip the cooling step.', 209 ,false, true, true, false, false, true, true, 'https://www.acouplecooks.com/wp-content/uploads/2022/03/Quinoa-Salad-008.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Lighter chicken cacciatore', '1 tbsp olive oil, 3 slices prosciutto, 1 medium onion, 2 garlic cloves, 2 sage sprigs, 2 rosemary sprigs, 4 skinless chicken breasts , 150ml dry white wine, 400g can plum tomatoes, 225g chestnut mushrooms','Trim any access fat off of the chicken thighs. Add the flour to a plate and add 1/2 tsp kosher salt and fresh cracked pepper. Dredge the chicken thighs in the flour to coat. Preheat the pan over medium high heat, and add olive oil spray. Sear the chicken thighs until golden brown (about 3-5 minutes per side) and then remove them from the pan and set aside. Chop the peppers and onions and mince the garlic. Add olive oil spray to the same pan, reduce the heat to medium, and saute the peppers, onions and garlic. Cook the peppers and onions for 5 minutes or until tender. Add the white wine to deglaze the pan. Add the chicken broth and diced tomatoes with juices to the pan. Scrape the bottom of the pan to get all of the brown bits off. Add the capers and tomato paste to the pan, along with the oregano and the remaining 1 teaspoon of kosher salt. Bring the sauce to a simmer. Return the chicken thighs to the pan and submerge them in the sauce. Simmer for 30 minutes or until the sauce is thickened and the chicken is tender. Add the fresh basil and parsley.', 760, false, true, true, false, false, true, true, 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/lighter-chicken-cacciatore-c94e376.jpg?quality=90&webp=true&resize=300');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Miso Salmon', 'Salmon, Miso, Soy sauce, Sake, Mirin, Roasted sesame oil', 'Make the miso marinade and marinate the salmon for 1-2 hours. Remove the marinade from the salmon and bake it.Change to a broiler and cook until the salmon are nicely charred. Serve and enjoy!', 500, false, true, true, false, false, true, true, 'https://www.justonecookbook.com/wp-content/uploads/2014/09/Miso-Salmon-III-600x900.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Buckwheat Banana Pancakes', '1 1/2 bananas, 1/2 cup buckwheat flour, 1 tsp coconut oil, 3 tbsp almond milk, 1/2 cup water, 1/2 cup blueberries, 1/2 cup strawberries, 1 tbsp coconut meat', 
	'Mash the banana with a fork. In a bowl mix the flour, mashed banana, melted coconut oil, milk, and water to a homogenous mixture. Add more water, if the batter is too thick. In a pan heat a bit of coconut oil and fry the pancakes on medium heat until they are gold brown on both sides. Cook in batches, as needed. Serve topped with berries, coconut, and honey.', 
	640, true, false, false, true, true, false, false, 'https://images.eatthismuch.com/img/233395_margaritaencv_ba53b749-96c8-4e3d-bad4-143b486837ea.png');


--select * from recipes



INSERT INTO plans (plan_name) VALUES ( 'high protein');
--SELECT * FROM plans
--SELECT * FROM users

INSERT INTO user_plan VALUES ((SELECT user_id FROM users WHERE user_id = 1 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
--SELECT * FROM user_plan	
	
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Monday');	
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Monday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Monday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Tuesday');		
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Tuesday');	
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Tuesday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Wednesday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Wednesday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Wednesday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Thursday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Thursday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Thursday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Friday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Friday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Friday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Saturday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Saturday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Saturday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Sunday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Sunday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Sunday');
--SELECT * FROM meals

INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 2 ),(SELECT plan_id FROM plans WHERE plan_id = 1));					  
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 3 ),(SELECT plan_id FROM plans WHERE plan_id = 1));									  
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 4 ),(SELECT plan_id FROM plans WHERE plan_id = 1));		
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 5 ),(SELECT plan_id FROM plans WHERE plan_id = 1));		
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 6 ),(SELECT plan_id FROM plans WHERE plan_id = 1));		
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 7 ),(SELECT plan_id FROM plans WHERE plan_id = 1));		
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 8 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 9 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 10 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 11 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 12 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 13 ),(SELECT plan_id FROM plans WHERE plan_id = 1));								  
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 14 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 15 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 16 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 17 ),(SELECT plan_id FROM plans WHERE plan_id =1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 18 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 19 ),(SELECT plan_id FROM plans WHERE plan_id =1));							  
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 20 ),(SELECT plan_id FROM plans WHERE plan_id =1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 21 ),(SELECT plan_id FROM plans WHERE plan_id =1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 22 ),(SELECT plan_id FROM plans WHERE plan_id =1));


INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 2 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 6));					  
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 3 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 2));									  
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 4 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 1));		
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 5 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 3));		
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 6 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 2));		
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 7 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 4));		
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 8 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 8));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 9 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 9));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 10 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 1));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 11 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 3));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 12 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 2));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 13 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 10));								  
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 14 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 6));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 15 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 8));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 16 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 1));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 17 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 8));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 18 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 9));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 19 ),(SELECT recipe_id FROM recipes WHERE recipe_id =7));							  
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 20 ),(SELECT recipe_id FROM recipes WHERE recipe_id =8));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 21 ),(SELECT recipe_id FROM recipes WHERE recipe_id =9));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 22 ),(SELECT recipe_id FROM recipes WHERE recipe_id =7));
--SELECT * FROM meal_recipe							  
							  
							  
							  						  
							  
--INSERT INTO plans (plan_name) VALUES ( 'Cheat Week');




COMMIT;

