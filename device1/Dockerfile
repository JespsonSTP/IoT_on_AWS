#base image ususally the language our app is built in
FROM python

#copy our app dependecies to the container env
COPY requirements.txt /app/requirements.txt

#letting the container know the working directory
#all changes will be made on that directory
WORKDIR /app

#Install dependencies
RUN pip install -r requirements.txt

#letting whooever running the file whoch port will be used by the container
EXPOSE 5000


#copy our app to the container env
COPY . /app


#both ENTRPOINT and CMD are used to specify a cmd on container startup 
#the problem comes when we are in development and make changes entrpoint cannot be overwriiten
#so it's less flexible and will always run, so if  you have a cmd you wan to run at startup use entrpoint for stable things 
CMD python device1.py
