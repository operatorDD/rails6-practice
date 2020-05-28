Rails.application.configure do
  config.baukis2 = {
    staffs: { host: 'baukis2.example.com', path: '' },
    admins: { host: 'baukis2.example.com', path: 'admins'},
    customers: { host: 'example.com', path: 'mypage' }
  }
end
