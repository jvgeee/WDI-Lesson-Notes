Carrierwave and S3
=====

## Opening

We now know how to setup a bucket on S3. We have saved our environment variables to our .zshrc file. Let's just check that they are there:

```
env
```

If you can't see them, `source ~/.zshrc`.

Let's hook up the app to work with S3 and these ENV vars.

#### Send over the code

Send across the code from the carrierwave lesson.

<br>

## We Do: Install fog

We need to install a gem that the CarrierWave gem needs in order to work nicely with cloud services, it is called 'fog'.

Fog is a very powerful gem that abstracts away all the complexity of cloud services. 

It lets us switch between rival providers relatively easily. AWS is the biggest, but there are a growing number of alternatives out there.

So, let's add the fog gem to the Gemfile of our rails app.

```
gem 'fog', '1.29.0'
```

And:

```
bundle
```

You should see lots of smaller gems that relate to specific services.

For this gem, we need to:

```
rbenv rehash
```

(We do this every time you install a new version of Ruby or install a gem that provides a terminal command).

<br>

##We Do: Update the uploader

Let's go to the uploader in our app, 

```
app>uploaders>graffiti_image_uploader.rb
```

Comment out the line that says:

```
storage :file
``` 

Uncomment the lint that says:

```
storage :fog
```

How easy is that?!

<br>

## We Do: Create an initializer

We're almost done, the only remaining thing to do is to add configuration information to our app, so that it can talk with AWS and use S3. 

#### What is an initializer?

Initializers are files that Rails use to setup specific configuration details. If you change an initializer you need to restart your app.

Let's create an initializer in our the folder `config/initializers` and call it "carrierwave.rb". 

```
touch config/initializers/carrierwave.rb
```

The [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) README on github gives us an example initiali`er to get started with.

Copy and paste this into our new file:

```
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',                                # required
    aws_access_key_id: '<your AWSAccessKeyId>',     # required
    aws_secret_access_key: '<your AWSSecretKey>',   # required
    region: 'eu-west-1',                            # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = '<your bucket name>'      # required
  config.fog_public  = true                         # optional, defaults to true
end
```

<br>

## We Do: Add the AWS credentials

We can amend our carrierwave initializer to make use of the ENV variables we setup:

```
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',                                      # required
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],          # required
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],  # required
    region: 'eu-west-1',                                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['WDI_S3_BUCKET']            # required
  config.fog_public  = true                               # optional, defaults to true
end
```

**Note:** There are no quotes around the ENV. Quotes inside though!

<br>

## We Do: Drop the db and re-upload an image

Let's test if it is working. 

First we need to drop the database, as the image urls are already saved.

```
rake db:drop db:create db:migrate
``

Navigate to:

```
http://localhost:3000/
```

Upload an image

#### Inspect the element

You should see that the image path is similar to:

```
<img src="https://wdi-lnd-test-bucket.s3.amazonaws.com/uploads/location/graffiti_image/1/thumb_29mural2406.jpg" alt="Thumb 29mural2406">
```