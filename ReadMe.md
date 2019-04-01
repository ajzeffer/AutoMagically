# Dotnet Core App W/ Multiple Project Dependencies

-Dockerfile needs to be in the root of the solution
 
-You should call docker build from the root as well
 
Build Command: 
```
 docker build -t ajzeffer/automagically:1.1 -f 'presentation.dockerfile' .
```

Then you can run 
``` 
docker run -p 80:5000 ajzeffer/automagically:1.1
```

Then browse to localhost ...

Boom Shaka Laka

## Gotchas
I used the dotnet CLI to add my project references and when I did that I typed 
dotnet add Automagically.Presentation reference Automagically.Domain

` CASE SENSITIVITY broke it Automagically need to be AutoMagically .. DOH` 