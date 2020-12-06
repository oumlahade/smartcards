clean:
	@pip3 install -r requirements.txt

deploy:
	@gcloud beta app deploy --project quickstart-1603319439833

run-flask:
	@FLASK_ENV=development FLASK_APP=server flask run

run:
	@make run-flask