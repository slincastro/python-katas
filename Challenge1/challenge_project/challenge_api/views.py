from django.shortcuts import render
# Create your views here.
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import PostSerializers
from .models import Post
from rest_framework import status
from django.http import Http404
    
class Post_APIView(APIView):
    def get(self, request, format=None, *args, **kwargs):
        post = Post.objects.all()
        serializer = PostSerializers(post, many=True)
        
        #return Response(serializer.data)
        return Response("todo bien")