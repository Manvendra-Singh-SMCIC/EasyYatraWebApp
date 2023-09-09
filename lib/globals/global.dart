import 'package:flutter/material.dart';

class Global {
  static bool loggedin = false;
  static List<int> RoomData = [1, 1, 0];
  static String city = "";
  static DateTimeRange initialDateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 3)),
  );
  static DateTimeRange? selectedDateRange;

  void destroy() {
    loggedin = false;
  }

  doit() {
    initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(days: 3)),
    );

    RoomData = [1, 1, 0];
  }

  static String hotelDesc =
      "Welcome to our luxurious and elegant hotel, nestled in the heart of a vibrant city. We pride ourselves on offering exceptional service and creating an unforgettable experience for our guests.As soon as you step into our grand lobby, you'll be greeted by our friendly and professional staff who are dedicated to ensuring your stay is nothing short of perfect. Our beautifully designed rooms and suites provide the utmost comfort, with plush beds, modern amenities, and stunning views of the city skyline.Indulge in a wide range of culinary delights at our on-site restaurants, where our talented chefs create mouthwatering dishes using the finest ingredients. From international cuisine to local specialties, there's something to satisfy every palate. After a delicious meal, unwind with a refreshing drink at our elegant bar or relax by our sparkling rooftop pool.For those seeking relaxation and rejuvenation, our spa offers a haven of tranquility. Treat yourself to a massage or indulge in a pampering beauty treatment, leaving you feeling refreshed and revitalized. Stay active and maintain your fitness routine at our state-of-the-art gym, equipped with the latest equipment and personalized training sessions available.Whether you're visiting for business or leisure, our hotel offers an array of amenities and services to cater to your every need. With versatile event spaces and modern conference facilities, we are the ideal choice for meetings, conferences, and social gatherings. Our dedicated event planning team will ensure your event is a resounding success.Explore the city and discover its rich culture, vibrant nightlife, and iconic landmarks. Our concierge desk is always ready to assist you with recommendations and arranging tours to make the most of your stay.At our hotel, we believe in going above and beyond to create unforgettable memories. We invite you to experience true luxury and hospitality during your stay with us. Welcome to our hotel, your home away from home." +
          "\n\nWelcome to our luxurious and elegant hotel, nestled in the heart of a vibrant city. We pride ourselves on offering exceptional service and creating an unforgettable experience for our guests.As soon as you step into our grand lobby, you'll be greeted by our friendly and professional staff who are dedicated to ensuring your stay is nothing short of perfect. Our beautifully designed rooms and suites provide the utmost comfort, with plush beds, modern amenities, and stunning views of the city skyline.Indulge in a wide range of culinary delights at our on-site restaurants, where our talented chefs create mouthwatering dishes using the finest ingredients. From international cuisine to local specialties, there's something to satisfy every palate. After a delicious meal, unwind with a refreshing drink at our elegant bar or relax by our sparkling rooftop pool.For those seeking relaxation and rejuvenation, our spa offers a haven of tranquility. Treat yourself to a massage or indulge in a pampering beauty treatment, leaving you feeling refreshed and revitalized. Stay active and maintain your fitness routine at our state-of-the-art gym, equipped with the latest equipment and personalized training sessions available.Whether you're visiting for business or leisure, our hotel offers an array of amenities and services to cater to your every need. With versatile event spaces and modern conference facilities, we are the ideal choice for meetings, conferences, and social gatherings. Our dedicated event planning team will ensure your event is a resounding success.Explore the city and discover its rich culture, vibrant nightlife, and iconic landmarks. Our concierge desk is always ready to assist you with recommendations and arranging tours to make the most of your stay.At our hotel, we believe in going above and beyond to create unforgettable memories. We invite you to experience true luxury and hospitality during your stay with us. Welcome to our hotel, your home away from home." +
          "\n\nWelcome to our luxurious and elegant hotel, nestled in the heart of a vibrant city. We pride ourselves on offering exceptional service and creating an unforgettable experience for our guests.As soon as you step into our grand lobby, you'll be greeted by our friendly and professional staff who are dedicated to ensuring your stay is nothing short of perfect. Our beautifully designed rooms and suites provide the utmost comfort, with plush beds, modern amenities, and stunning views of the city skyline.Indulge in a wide range of culinary delights at our on-site restaurants, where our talented chefs create mouthwatering dishes using the finest ingredients. From international cuisine to local specialties, there's something to satisfy every palate. After a delicious meal, unwind with a refreshing drink at our elegant bar or relax by our sparkling rooftop pool.For those seeking relaxation and rejuvenation, our spa offers a haven of tranquility. Treat yourself to a massage or indulge in a pampering beauty treatment, leaving you feeling refreshed and revitalized. Stay active and maintain your fitness routine at our state-of-the-art gym, equipped with the latest equipment and personalized training sessions available.Whether you're visiting for business or leisure, our hotel offers an array of amenities and services to cater to your every need. With versatile event spaces and modern conference facilities, we are the ideal choice for meetings, conferences, and social gatherings. Our dedicated event planning team will ensure your event is a resounding success.Explore the city and discover its rich culture, vibrant nightlife, and iconic landmarks. Our concierge desk is always ready to assist you with recommendations and arranging tours to make the most of your stay.At our hotel, we believe in going above and beyond to create unforgettable memories. We invite you to experience true luxury and hospitality during your stay with us. Welcome to our hotel, your home away from home." +
          "\n\nWelcome to our luxurious and elegant hotel, nestled in the heart of a vibrant city. We pride ourselves on offering exceptional service and creating an unforgettable experience for our guests.As soon as you step into our grand lobby, you'll be greeted by our friendly and professional staff who are dedicated to ensuring your stay is nothing short of perfect. Our beautifully designed rooms and suites provide the utmost comfort, with plush beds, modern amenities, and stunning views of the city skyline.Indulge in a wide range of culinary delights at our on-site restaurants, where our talented chefs create mouthwatering dishes using the finest ingredients. From international cuisine to local specialties, there's something to satisfy every palate. After a delicious meal, unwind with a refreshing drink at our elegant bar or relax by our sparkling rooftop pool.For those seeking relaxation and rejuvenation, our spa offers a haven of tranquility. Treat yourself to a massage or indulge in a pampering beauty treatment, leaving you feeling refreshed and revitalized. Stay active and maintain your fitness routine at our state-of-the-art gym, equipped with the latest equipment and personalized training sessions available.Whether you're visiting for business or leisure, our hotel offers an array of amenities and services to cater to your every need. With versatile event spaces and modern conference facilities, we are the ideal choice for meetings, conferences, and social gatherings. Our dedicated event planning team will ensure your event is a resounding success.Explore the city and discover its rich culture, vibrant nightlife, and iconic landmarks. Our concierge desk is always ready to assist you with recommendations and arranging tours to make the most of your stay.At our hotel, we believe in going above and beyond to create unforgettable memories. We invite you to experience true luxury and hospitality during your stay with us. Welcome to our hotel, your home away from home." +
          "\n\nWelcome to our luxurious and elegant hotel, nestled in the heart of a vibrant city. We pride ourselves on offering exceptional service and creating an unforgettable experience for our guests.As soon as you step into our grand lobby, you'll be greeted by our friendly and professional staff who are dedicated to ensuring your stay is nothing short of perfect. Our beautifully designed rooms and suites provide the utmost comfort, with plush beds, modern amenities, and stunning views of the city skyline.Indulge in a wide range of culinary delights at our on-site restaurants, where our talented chefs create mouthwatering dishes using the finest ingredients. From international cuisine to local specialties, there's something to satisfy every palate. After a delicious meal, unwind with a refreshing drink at our elegant bar or relax by our sparkling rooftop pool.For those seeking relaxation and rejuvenation, our spa offers a haven of tranquility. Treat yourself to a massage or indulge in a pampering beauty treatment, leaving you feeling refreshed and revitalized. Stay active and maintain your fitness routine at our state-of-the-art gym, equipped with the latest equipment and personalized training sessions available.Whether you're visiting for business or leisure, our hotel offers an array of amenities and services to cater to your every need. With versatile event spaces and modern conference facilities, we are the ideal choice for meetings, conferences, and social gatherings. Our dedicated event planning team will ensure your event is a resounding success.Explore the city and discover its rich culture, vibrant nightlife, and iconic landmarks. Our concierge desk is always ready to assist you with recommendations and arranging tours to make the most of your stay.At our hotel, we believe in going above and beyond to create unforgettable memories. We invite you to experience true luxury and hospitality during your stay with us. Welcome to our hotel, your home away from home." +
          "\n\nWelcome to our luxurious and elegant hotel, nestled in the heart of a vibrant city. We pride ourselves on offering exceptional service and creating an unforgettable experience for our guests.As soon as you step into our grand lobby, you'll be greeted by our friendly and professional staff who are dedicated to ensuring your stay is nothing short of perfect. Our beautifully designed rooms and suites provide the utmost comfort, with plush beds, modern amenities, and stunning views of the city skyline.Indulge in a wide range of culinary delights at our on-site restaurants, where our talented chefs create mouthwatering dishes using the finest ingredients. From international cuisine to local specialties, there's something to satisfy every palate. After a delicious meal, unwind with a refreshing drink at our elegant bar or relax by our sparkling rooftop pool.For those seeking relaxation and rejuvenation, our spa offers a haven of tranquility. Treat yourself to a massage or indulge in a pampering beauty treatment, leaving you feeling refreshed and revitalized. Stay active and maintain your fitness routine at our state-of-the-art gym, equipped with the latest equipment and personalized training sessions available.Whether you're visiting for business or leisure, our hotel offers an array of amenities and services to cater to your every need. With versatile event spaces and modern conference facilities, we are the ideal choice for meetings, conferences, and social gatherings. Our dedicated event planning team will ensure your event is a resounding success.Explore the city and discover its rich culture, vibrant nightlife, and iconic landmarks. Our concierge desk is always ready to assist you with recommendations and arranging tours to make the most of your stay.At our hotel, we believe in going above and beyond to create unforgettable memories. We invite you to experience true luxury and hospitality during your stay with us. Welcome to our hotel, your home away from home.";
}