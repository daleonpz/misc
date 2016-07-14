#!/usr/bin/python2.7

class Song(object):

	def __init__(self, lyrics, year):
		self.lyrics = lyrics
		self.year = year

	def sing_me_a_song(self):
		for line in self.lyrics:
			print line

	def album_year(self):
		print "%d" % self.year

happy_bday = Song(["Happy birthday to you", 
		  "I don't want to get sued",
		  "So I'll stop right there"],1981)

bulls_on_parade = Song(["They rally around  the family",
		       "With pockets full of shells"],1999)

happy_bday.sing_me_a_song()
happy_bday.album_year()

bulls_on_parade.sing_me_a_song()
bulls_on_parade.album_year()
