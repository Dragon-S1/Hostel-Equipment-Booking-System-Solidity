# Hostel-Equipment-Booking-System-Solidity
## Description
In this project I have made a smart contract in solidity which can be used as a
booking system in IIT Madras hostel (or any other hostels which have these
services).
<br />
In our hostel the security guard have keys for the TV room, sports room, storage
room, etc. and thus we have to go to the security guard (who is at the entrance of
the hostel) to get the keys or any sport equipment. Students have to submit their
student id card and sign on the register.
<br />
This smart contract aims to replace that system and make it more easier and
convenient.

## Problems in the System
There are some problems or inconvenience faced in the system present in the
hostels at this moment which the smart contract aims to solve:
- For the booking of any item we have to provide our id card and also get it back
after returning the item. So if you don't have your id card and you are at the
entrance and suddenly plan to play with your friends, you have to go back to
your room and come back with the id card. Similar many situations can be
thought of. This increase the hassle and decrease the motivation to play at times
if you are lazy.
- You cant know if the item is available without going straight to the security guard.
More hassle with disappointment.
- If someone want the item directly from you after you are done using it. First
thing, if something happens to the item, you will be held responsible as your
name is registered for booking of the item. And in case you want to switch the id
cards and tell them to get your id card and book from their, it again decrease the
motivation to do so for the other person.
- You cant always track who owns the item at some moment (Many occurrence
happens often where checking the security cameras is required to track the
owner).

## Problems Solved by Smart Contract
The problems solved with the contract:
- Faster booking, just from the tap from your finger
- Can check the availability of item in real time, any time.
- Can transfer ownership to someone directly
- Can easily check who owns which items
- With good technology can convert this into vending machine mechanism

## Technical Details
Some functions that can be performed in the smart contract:
- Each item is considered as a NFT
- The contract owner can mint new tokens or burn them according to the need
- We can also add the metadata to the token according to the item
- Everyone can query the owner address, which address owns the token, URI of metadata, total number of tokens.
- The token owner can transfer the token to another user if the user is accepting the token
- The users can set a token they are willing to accept, this avoid someone transferring ownership without consent
- Everyone can query what token an address is accepting currently.
- Everyone can query availability of a token
- All tokens owned by each user can be seen publicly

## Vulnerability
- Tokens can me minted by the owner only. So malicious mint or burn can only happen if the identity of owner is compromised.
- Other users are vulnerable only if their identity is compromised for transfer of ownerships.

## Conclusion
This project aims to solve many problems related to booking system in hostels. It
increase efficiency, security, accountability and openness in the booking system. It
can also be developed further to increase the usage and functionalities. We can add
booking periods, penalties, track the transfer of ownership etc functionality to
improve the usage.
