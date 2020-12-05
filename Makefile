clean:
	@pip3 install -r requirements.txt

deploy:
	# @gcloud beta app deploy --project divine-cortex-277508

run-flask:
	@FLASK_ENV=development FLASK_APP=server flask run

run:
	@make run-flask