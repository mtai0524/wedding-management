using AutoMapper;
using CodeFirst.Models.Chat;
using CodeFirst.Models.Chat.ChatModels;
using WebApplication1.Helpers;

public class MessageProfile : Profile
{
    public MessageProfile()
    {
        CreateMap<Message, MessageViewModel>()
            .ForMember(dst => dst.From, opt => opt.MapFrom(x => x.ApplicationUser != null ? x.ApplicationUser.FirstName : string.Empty))
            .ForMember(dst => dst.Room, opt => opt.MapFrom(x => x.Room != null ? x.Room.Name : string.Empty))
            .ForMember(dst => dst.Avatar, opt => opt.MapFrom(x => x.ApplicationUser != null ? x.ApplicationUser.Avatar : string.Empty))
            .ForMember(dst => dst.Content, opt => opt.MapFrom(x => BasicEmojis.ParseEmojis(x.Content)))
            .ForMember(dst => dst.Timestamp, opt => opt.MapFrom(x => x.Timestamp));
        CreateMap<MessageViewModel, Message>();
    }
}
