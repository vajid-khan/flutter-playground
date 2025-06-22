import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class DictionaryPhoneticItem extends StatefulWidget {
  const DictionaryPhoneticItem({
    super.key,
    required this.phonetic,
    // required this.player,
  });
  final dynamic phonetic;
  // final AudioPlayer player;

  @override
  State<DictionaryPhoneticItem> createState() => _DictionaryPhoneticItem();
}

class _DictionaryPhoneticItem extends State<DictionaryPhoneticItem> {

  late AudioPlayer player;
  bool isPlaying = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    
    // Create the audio player with better configuration
    player = AudioPlayer();
    
    // Set the release mode to keep the source after playback has completed
    player.setReleaseMode(ReleaseMode.stop);
    
    // Set player mode for better performance
    player.setPlayerMode(PlayerMode.mediaPlayer);
    
    // Set volume to ensure it's audible
    player.setVolume(1.0);
    
    // Listen for when audio finishes playing
    player.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          isPlaying = false;
        });
      }
    });
    
    // Listen for player state changes
    player.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });
  }

  @override
  void dispose() {
    // Release all sources and dispose the player
    player.dispose();
    super.dispose();
  }

  Future<bool> _isUrlAccessible(String url) async {
    try {
      final response = await http.head(Uri.parse(url)).timeout(Duration(seconds: 5));
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('URL accessibility check failed: $e');
      return false;
    }
  }

  Future<void> _playAudio(String audioUrl) async {
    try {
      // Simple direct play approach with longer timeout
      debugPrint('Attempting to play audio: $audioUrl');
      
      // Stop any current playback first
      await player.stop();
      
      // Wait a moment for the stop to complete
      await Future.delayed(Duration(milliseconds: 100));
      
      // Try to play with a reasonable timeout
      await player.play(UrlSource(audioUrl)).timeout(
        Duration(seconds: 15),
        onTimeout: () {
          debugPrint('Audio play timeout after 15 seconds');
          player.stop();
          throw TimeoutException('Audio play timeout', Duration(seconds: 15));
        },
      );
      
      debugPrint('Audio play started successfully');
    } catch (e) {
      debugPrint('Error in _playAudio: $e');
      // Make sure to stop the player on error
      try {
        await player.stop();
      } catch (stopError) {
        debugPrint('Error stopping player: $stopError');
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: ListTile(
        title: Text(widget.phonetic['text']),
        trailing:
            isPlaying ?
						IconButton(
                  onPressed: () async {
                    try {
                      await player.pause();
                    } catch (e) {
                      debugPrint('Error pausing audio: $e');
                    }
                  },
                  icon: Icon(Icons.pause),
                )
                : IconButton(
                  onPressed: isLoading ? null : () async {
                    try {
                      setState(() {
                        isLoading = true;
                      });
                      
                      // Stop any currently playing audio first
                      await player.stop();
                      
                      // Debug the audio URL
                      // final audioUrl = 'https://samplelib.com/lib/preview/mp3/sample-3s.mp3'; //
                      final audioUrl = widget.phonetic['audio'];
											 widget.phonetic['audio'];
                      debugPrint('Playing audio URL: $audioUrl');
                      
                      // Validate URL
                      if (audioUrl == null || audioUrl.toString().isEmpty) {
                        debugPrint('Invalid audio URL: $audioUrl');
                        setState(() {
                          isLoading = false;
                        });
                        return;
                      }
                      
                      // Check if URL is accessible
                      final isAccessible = await _isUrlAccessible(audioUrl.toString());
                      if (!isAccessible) {
                        debugPrint('Audio URL is not accessible: $audioUrl');
                        setState(() {
                          isLoading = false;
                        });
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Audio file not available'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                        return;
                      }
                      
                      // Try to play the audio directly
                      await _playAudio(audioUrl.toString());
                      
                      setState(() {
                        isLoading = false;
                      });
                    } catch (e) {
                      // Handle error if audio fails to play
                      debugPrint('Error playing audio: $e');
                      setState(() {
                        isPlaying = false;
                        isLoading = false;
                      });
                      
                      // Show a snackbar to inform the user
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Unable to play audio. Please try again.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    }
                  },
                  icon: isLoading 
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(Icons.play_arrow),
                ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey[300]!),
        ),
      ),
    );
  }
}
