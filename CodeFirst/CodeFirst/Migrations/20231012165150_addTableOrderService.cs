using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class addTableOrderService : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "OrderService",
                columns: table => new
                {
                    OrderServiceId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    InvoiceID = table.Column<int>(type: "int", nullable: true),
                    ServiceId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OrderService", x => x.OrderServiceId);
                    table.ForeignKey(
                        name: "FK_OrderService_Invoice_InvoiceID",
                        column: x => x.InvoiceID,
                        principalTable: "Invoice",
                        principalColumn: "InvoiceID");
                    table.ForeignKey(
                        name: "FK_OrderService_ServiceEntity_ServiceId",
                        column: x => x.ServiceId,
                        principalTable: "ServiceEntity",
                        principalColumn: "ServiceId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_OrderService_InvoiceID",
                table: "OrderService",
                column: "InvoiceID");

            migrationBuilder.CreateIndex(
                name: "IX_OrderService_ServiceId",
                table: "OrderService",
                column: "ServiceId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "OrderService");
        }
    }
}
