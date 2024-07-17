using CodeFirst.ViewModels;

namespace CodeFirst.Services
{
    public interface IVnPayService
    {
        string CreatePaymentUrl(HttpContext context);
        VnPaymentResponseModel PaymentExecute(IQueryCollection collections);
    }
}
